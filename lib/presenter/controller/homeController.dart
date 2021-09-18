import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/usecase/feachCharacters.dart';
import 'package:marvelcharacters/domain/usecase/feachCharactersFromName.dart';

class HomeController extends StreamStore<Exception, List<Character>> {
  late Future<List<CharacterModel>> future;
  late FetchCharactersUseCase fetchCharactersUseCase;
  late FetchCharactersFromNameUseCase fetchCharactersFromName;

  HomeController(this.fetchCharactersUseCase, this.fetchCharactersFromName) : super([]);
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;
  List<Character> listCharacter = [];
  List<Character> listFilteredCharacter = [];
  List<Character> currentList = [];
  bool loadactive = false;

  maxScrollExtentVerify() {
    scrollController.addListener(() async {
      double onLoadPosition = scrollController.position.maxScrollExtent - 20;
      if (scrollController.position.pixels >= onLoadPosition) {
        offset += 10;
        await fetchCharacters();
      }
    });
  }

  Future<void> fetchCharacters() async {
    setLoading(true);
    await fetchCharactersUseCase.fetchCharacters(limit, offset).then((value) {
      listCharacter.addAll(value);
      currentList = listCharacter;
      update(currentList);
      setLoading(false);
    });
  }

  Future<void> charactersFromName(String name) async {
    setLoading(true);
    await fetchCharactersFromName.fetchCharacters(name).then((value) {
      listFilteredCharacter.addAll(value);
      currentList = listFilteredCharacter.where((element){
        return element.name.toUpperCase().contains(name.toUpperCase());
      }).toList();
      print(currentList.length);
      update(currentList);
      setLoading(false);
    });
  }
}
