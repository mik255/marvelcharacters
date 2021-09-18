import 'package:marvelcharacters/domain/entity/character/Thumbnail.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

class ComicModel extends Comic {
  ComicModel({required String resourceURI, required String name})
      : super(resourceURI: resourceURI, name: name, thumbnail: Thumbnail(extension: '', path: ''));

  factory ComicModel.fromJson(Map<String, dynamic> jsonParser) {
    return ComicModel(
      resourceURI: jsonParser['resourceURI'],
      name: jsonParser['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceURI,
        'name': name,
      };
}
