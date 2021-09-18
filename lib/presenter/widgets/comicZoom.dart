import 'package:flutter/material.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

class ComicZoomItem extends StatefulWidget {
  ComicZoomItem({Key? key, required this.comic}) : super(key: key);
  Comic comic;

  @override
  _ComicZoomItemState createState() => _ComicZoomItemState();
}

class _ComicZoomItemState extends State<ComicZoomItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: widget.comic.resourceURI,
      child: InteractiveViewer(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/comicsbackground.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black87,
            ),
            Center(
              child: Container(
                height: 250,
                width: 150,
                child: Image.network(
                  widget.comic.thumbnail.getUrlImg(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
