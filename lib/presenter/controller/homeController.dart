import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/usecase/characterUsecase.dart';

class HomeController extends NotifierStore<Exception,List<Character>>{
  late Future<List<CharacterModel>> future;
  late CharacterUseCase characterUseCase;
  HomeController(this.characterUseCase) : super([]);
  ScrollController scrollController = ScrollController();
   int currentLoadCount = 10;
  List<Character> listCharacter =[];
  Future<void> maxScrollExtentVerify()async{
    scrollController.addListener((){
     if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
       currentLoadCount+=10;
       fetchCharacters();
     }
    });
  }

  fetchCharacters()async{
    setLoading(true);
    var result = await characterUseCase.fetchCharactersUseCase(currentLoadCount,0);
    listCharacter = result;
    update(result);
    setLoading(false);
  }
}