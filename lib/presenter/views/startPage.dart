import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/presenter/controller/homeController.dart';
import 'package:marvelcharacters/presenter/widgets/characterCard.dart';

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
              color: Colors.black54,
            ),
          ],
        ),
        ScopedBuilder(
          store: store,
          onLoading: (context) => Column(mainAxisAlignment: MainAxisAlignment.end, children: [initial]),
          onState: (context, value) => initial = Container(),
        ),
        TripleBuilder(
          store: store,
          builder: (context, triple) {
            return ListView.builder(
                controller: store.scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: store.listCharacter.length,
                itemBuilder: (BuildContext context, int index) {
                  var character = store.listCharacter[index];
                  if (index == store.listCharacter.length - 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CharactersList(
                    character: character,
                  );
                });
          },

        ),
      ],
    )));
  }
}
