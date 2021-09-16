class Thumbnail {
  String path;
  String extension;

  Thumbnail({required this.extension, required this.path});

  String getUrlImg() {
    return path + "." + extension;
  }
}
