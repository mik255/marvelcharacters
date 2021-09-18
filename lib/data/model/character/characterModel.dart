import 'dart:convert';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'comicModel.dart';
import 'thumbnailModel.dart';

class CharacterModel extends Character {
  ThumbnailModel characterThumbmailModel;
  List<ComicModel> comicModels;

  CharacterModel(
      {required int id, required String name, required this.characterThumbmailModel, required String description, required this.comicModels})
      : super(id: id, name: name, thumbnail: characterThumbmailModel, comics: comicModels, description: description);

  factory CharacterModel.fromJson(Map<String, dynamic> jsonParser) {
    List<dynamic> comicsMap = jsonParser['comics']['items'];
    return CharacterModel(
        id: jsonParser['id'],
        name: jsonParser['name'],
        characterThumbmailModel: ThumbnailModel.fromJson(jsonParser['thumbnail']),
        description: jsonParser['description'],
        comicModels: List<ComicModel>.from(comicsMap.map((e) => ComicModel.fromJson(e))));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        'name': name,
        'description': description,
        'thumbnail': characterThumbmailModel.toJson(),
        'comicModels': comicModels.map((e) => e.toJson()).toList(),
      };
}
