import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvelcharacters/data/model/character/thumbnailModel.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/data/model/character/comicModel.dart';

import '../../../mocks/fixtures/fixture_reader.dart';

void main() {
  group("fromJson", () {
    test("shoud fatch and return a correct characterModel from json fixture", () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('marvelCharacterResponse.json'));
      List<dynamic> characters = jsonMap['data']['results'];
      List<CharacterModel> charactermodels = [];
      for (Map<String, dynamic> character in characters) {
        charactermodels.add(CharacterModel.fromJson(character));
      }
      expect(charactermodels, isA<List<CharacterModel>>());
    });
  });
  group("toJson", () {
    ThumbnailModel characterthumbnailModel = ThumbnailModel(extension: 'extension', path: 'path');
    ComicModel comicModel = ComicModel(resourceURI: "resourceURI", name: "name");
    CharacterModel characterModel =
        CharacterModel(id: 1, name: "name", characterThumbmailModel: characterthumbnailModel, comicModels: [comicModel], description: 'description');

    test("shoud  return a JSON containing the proper map", () {
      final result = characterModel.toJson();
      expect(result, {
        "id": 1,
        "name": 'name',
        "description": "description",
        "thumbnail": {'extension': 'extension', 'path': 'path'},
        "comicModels": [
          {"resourceURI": "resourceURI", "name": "name"}
        ]
      });
    });
  });
}
