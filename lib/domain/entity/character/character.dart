




import 'comic.dart';
import 'Thumbnail.dart';

class Character{
  int id;
  String name;
  Thumbnail thumbnail;
  List<Comic> comics;
  String description;

  Character({
    required this.comics,
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description});
}