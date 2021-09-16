import 'package:marvelcharacters/domain/entity/character/Thumbnail.dart';

class ThumbnailModel extends Thumbnail {
  ThumbnailModel({required String extension, required String path})
      : super(extension: extension,path: path);
  factory ThumbnailModel.fromJson(Map<String, dynamic> jsonParser) {
    return ThumbnailModel(
      extension: jsonParser['extension'],
      path: jsonParser['path'],
    );
  }
  Map<String, dynamic> toJson() => {
    "extension": extension,
    'path': path,
  };
}
