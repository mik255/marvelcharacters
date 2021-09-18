import 'dart:convert';
import 'package:marvelcharacters/core/endpoints/endpoints.dart';
import 'package:marvelcharacters/core/httpClient/httpClient.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/data/model/character/comicDetailsModel.dart';
import 'package:marvelcharacters/data/src/characterDataSource.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

class CharacterDataSourceImplementation implements CharacterDataSource {
  HttpClient httpClient;

  CharacterDataSourceImplementation(this.httpClient);

  @override
  Future<List<CharacterModel>> fetchCharactersDataSource(int limit, int offset) async {
    late HttpClientResponse response;
    var endpoint = charactersEndpoint(limit: limit, offset: offset);
    response = await httpClient.get(endpoint);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      List<dynamic> charactersMap = data['data']['results'];
      return List<CharacterModel>.from(charactersMap.map((e) => CharacterModel.fromJson(e)));
    } else {
      throw Exception('error ${response.statusCode}');
    }
  }

  @override
  Future<List<Comic>> fetchComicsFromIdSource(int id) async {
    late HttpClientResponse response;
    var endpoint = characterComics(id: id);
    response = await httpClient.get(endpoint);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      List<dynamic> comicsMap = data['data']['results'];
      return List<Comic>.from(comicsMap.map((e) => ComicDetailsModels.fromJson(e)));
    } else {
      throw Exception('error ${response.statusCode}');
    }
  }
}
