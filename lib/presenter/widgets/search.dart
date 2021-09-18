import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({required this.onPressed, required this.onChange});

  Function(String name) onPressed;
  Function(String name) onChange;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search hero name",
                hintStyle: TextStyle(
                  color: Colors.black.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String value) {
                print(value);
                name = value;
                widget.onChange(name);
              },
            ),
          ),
          IconButton(
            color: Colors.black.withAlpha(120),
            onPressed: () {
              print(name);
              widget.onPressed(name);
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
