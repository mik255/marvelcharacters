import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/data/model/character/comicDetailsModel.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';
import 'package:marvelcharacters/presenter/controller/comicsDetailsController.dart';
import 'package:marvelcharacters/presenter/widgets/comicZoom.dart';

class ComicsDetails extends StatefulWidget {
  ComicsDetails({Key? key, required this.character}) : super(key: key);
  Character character;

  @override
  _ComicsDetailsState createState() => _ComicsDetailsState();
}

class _ComicsDetailsState extends ModularState<ComicsDetails, ComicsDetailsController> {
  circularProgressIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    store.fetchComicsFromId(widget.character.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ScopedBuilder(
              store: store,
              onState: (context, List<Comic> state) => Center(
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  widget.character.thumbnail.getUrlImg(),
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            widget.character.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'HeroesAssembleBoldExpandtalic',
                                                fontSize: 30,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            widget.character.description,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'HeroesAssembleBoldExpandtalic',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            'Comics',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'HeroesAssembleBoldExpandtalic',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsets.all(8),
                                            itemCount: state.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(padding: const EdgeInsets.all(8.0), child: HeroItem(comic: state[index]));
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              onError: (context, error) => Text(error.toString()),
              onLoading: (context) => Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            'assets/images/telatwoloading.png',
                            fit: BoxFit.cover,
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            circularProgressIndicator(),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
    );
  }
}

class HeroItem extends StatelessWidget {
  HeroItem({Key? key, required this.comic}) : super(key: key);
  Comic comic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComicZoomItem(comic: comic)));
      },
      child: Hero(
        tag: comic.resourceURI,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                )
              ],
              color: Color(0xff222429)),
          height: 150,
          width: 80,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loadingimg.gif',
            image: comic.thumbnail.getUrlImg(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
