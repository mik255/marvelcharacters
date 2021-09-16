


import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

abstract class CharacterDataSource{
  Future<List<Character>> fetchCharactersDataSource(int limit,int offset);
  Future<List<Comic>> fetchComicsFromIdSource(int id);
}