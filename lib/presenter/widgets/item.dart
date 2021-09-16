import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'itemtow.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.character,
  }) : super(key: key);
  final Widget thumbnail;
  Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context)
        .push(MaterialPageRoute(builder: (context)=>ComicsDetails(character: character,)));
      },
      child: Hero(
        tag: character.id.toString(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: thumbnail,
              ),
              Expanded(
                flex: 3,
                child: _VideoDescription(
                  heroName: character.name,
                  description: character.description,
                  comicsCount: character.comics.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.heroName,
    required this.description,
    required this.comicsCount,
  }) : super(key: key);

  final String heroName;
  final String description;
  final int comicsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        color: Colors.black45
                      ),

      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heroName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,color: Colors.white,fontFamily: 'HeroesAssembleBoldExpandtalic'
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
            Text(
              description,
              style: const TextStyle(fontSize: 10.0,color: Colors.white,fontFamily: 'HeroesAssembleBoldExpandtalic'),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(
              '$comicsCount comics',
              style: const TextStyle(fontSize: 10.0,color: Colors.white,fontFamily: 'HeroesAssembleBoldExpandtalic'),
            ),
          ],
        ),
      ),
    );
  }
}