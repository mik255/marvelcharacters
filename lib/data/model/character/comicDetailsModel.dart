import 'package:marvelcharacters/data/model/character/thumbnailModel.dart';
import 'package:marvelcharacters/domain/entity/character/Thumbnail.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';

class ComicDetailsModels extends Comic {
  ComicDetailsModels({required String resourceURI, required String name, required Thumbnail thumbnail})
      : super(resourceURI: resourceURI, name: name, thumbnail: thumbnail);

  factory ComicDetailsModels.fromJson(Map<String, dynamic> jsonParser) {
    return ComicDetailsModels(resourceURI: jsonParser['resourceURI'], name: '', thumbnail: ThumbnailModel.fromJson(jsonParser['thumbnail']));
  }

  Map<String, dynamic> toJson() => {"resourceURI": resourceURI, 'name': name, "thumbnail": thumbnail.getUrlImg()};
}
