import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/presenter/controller/homeController.dart';
import 'package:marvelcharacters/presenter/widgets/item.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, HomeController> {
  late Widget initial;

  @override
  void initState() {
    store.maxScrollExtentVerify();
    store.fetchCharacters();
    initial = circularProgressIndicator();
    super.initState();
  }

  circularProgressIndicator() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/loading.jpg',
                  fit: BoxFit.cover,
                )),
            Container(
              color: Colors.black45,
            ),
          ],
        ),
        ScopedBuilder(
          store: store,
          onLoading: (context) => Column(mainAxisAlignment: MainAxisAlignment.end, children: [initial]),
          onState: (context, value) => initial = Container(),
        ),
        ScopedBuilder(
            store: store,
            onState: (context, List<Character> state) => ListView.builder(
                controller: store.scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: state.length,
                itemBuilder: (BuildContext context, int index) {
                  var character = state[index];
                  if (index == state.length - 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomListItem(
                    character: character,
                    thumbnail: Container(
                      height: 180,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Color(0xff222429)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loadingimg.gif',
                        image: state[index].thumbnail.getUrlImg(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
            onError: (context, error) => Text(error.toString()),
            onLoading: (context) => ListView.builder(
                controller: store.scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: store.listCharacter.length,
                itemBuilder: (BuildContext context, int index) {
                  var character = store.listCharacter[index];
                  if (index == store.listCharacter.length - 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomListItem(
                    character: character,
                    thumbnail: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Color(0xff222429)),
                      child: Image.network(character.thumbnail.getUrlImg()),
                    ),
                  );
                })),
      ],
    )));
  }
}
