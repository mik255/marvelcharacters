import 'package:marvelcharacters/data/src/characterDataSource.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';
import 'package:marvelcharacters/domain/repository/characterRepository.dart';

class CharacterRepositoryImplementation implements CharacterRepository {
  CharacterDataSource _characterDataSource;

  CharacterRepositoryImplementation(this._characterDataSource);

  @override
  Future<List<Character>> fetchCharacters(int limit, int offset) async {
    return await _characterDataSource.fetchCharactersDataSource(limit, offset);
  }

  @override
  Future<List<Comic>> fetchComicsFromId(int id) async {
    return await _characterDataSource.fetchComicsFromIdSource(id);
  }
}
