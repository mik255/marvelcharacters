import 'package:marvelcharacters/core/utils/keys/apikey.dart';
import 'package:marvelcharacters/core/utils/md5Converter/md5Converter.dart';

String charactersEndpoint({required int limit, required int offset}) {
  return "http://gateway.marvel.com/v1/public/characters?ts=${MarvelApiKeys.timeStamp}&apikey=${MarvelApiKeys.publicKey}&hash=${MarvelApiKeys.hash}&limit=$limit&offset=$offset";
}

String characterComics({required int id}) {
  return "http://gateway.marvel.com/v1/public/characters/$id/comics?ts=${MarvelApiKeys.timeStamp}&apikey=${MarvelApiKeys.publicKey}&hash=${MarvelApiKeys.hash}";
}

String fetchCharactersFromNameEndPoint({required String name}) {
  return "http://gateway.marvel.com/v1/public/characters?ts=${MarvelApiKeys.timeStamp}&apikey=${MarvelApiKeys.publicKey}&hash=${MarvelApiKeys.hash}&nameStartsWith=$name";
}