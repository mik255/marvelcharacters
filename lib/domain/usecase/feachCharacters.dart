import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/repository/characterRepository.dart';

class FetchCharactersUseCase {
  CharacterRepository characterRepository;

  FetchCharactersUseCase(this.characterRepository);

  Future<List<Character>> fetchCharacters(int limit, int offset) async {
    return await characterRepository.fetchCharacters(limit, offset);
  }
}
