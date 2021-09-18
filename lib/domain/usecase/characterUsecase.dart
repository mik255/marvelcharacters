import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/repository/characterRepository.dart';

class CharacterUseCase {
  CharacterRepository characterRepository;

  CharacterUseCase(this.characterRepository);

  Future<List<Character>> fetchCharactersUseCase(int limit, int offset) async {
    return await characterRepository.fetchCharacters(limit, offset);
  }
}
