


import 'package:marvelcharacters/domain/entity/character/comic.dart';
import 'package:marvelcharacters/domain/repository/characterRepository.dart';

class FetchComicsFromIdUseCase{
  CharacterRepository characterRepository;
  FetchComicsFromIdUseCase(this.characterRepository);
  Future<List<Comic>> fetchComicsFromId(int id) async{
    return await characterRepository.fetchComicsFromId(id);
  }

}