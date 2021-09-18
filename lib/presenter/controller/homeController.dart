import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/usecase/characterUsecase.dart';

class HomeController extends StreamStore<Exception, List<Character>> {
  late Future<List<CharacterModel>> future;
  late CharacterUseCase characterUseCase;

  HomeController(this.characterUseCase) : super([]);
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;
  List<Character> listCharacter = [];
  bool loadactive = false;

   maxScrollExtentVerify(){
    scrollController.addListener(() async{
      double onLoadPosition = scrollController.position.maxScrollExtent-20;
      if (scrollController.position.pixels >= onLoadPosition) {
        print('test');
        offset += 10;
        await fetchCharacters();
      }
    });
  }

  Future<void>fetchCharacters() async {
    setLoading(true);
     await characterUseCase.fetchCharactersUseCase(limit, offset).then((value){
      listCharacter.addAll(value);
      update(listCharacter);
      setLoading(false);
      print('update');
    });

  }
}
