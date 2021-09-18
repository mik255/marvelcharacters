import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchCharacters(int limit, int offset);

  Future<List<Character>> fetchCharactersFromName(String name);

  Future<List<Comic>> fetchComicsFromId(int id);
}
