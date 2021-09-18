import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/repository/characterRepository.dart';

class FetchCharactersFromNameUseCase {
  CharacterRepository characterRepository;

  FetchCharactersFromNameUseCase(this.characterRepository);

  Future<List<Character>> fetchCharacters(String name) async {
    return await characterRepository.fetchCharactersFromName(name);
  }
}
