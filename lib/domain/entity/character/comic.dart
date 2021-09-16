


import 'package:marvelcharacters/domain/entity/character/Thumbnail.dart';

class Comic{
  String resourceURI;
  String name;
  Thumbnail thumbnail;

  Comic({required this.resourceURI, required this.name,required this.thumbnail});
}