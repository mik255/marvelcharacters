import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/domain/entity/character/character.dart';
import 'package:marvelcharacters/domain/entity/character/comic.dart';
import 'package:marvelcharacters/domain/usecase/characterUsecase.dart';
import 'package:marvelcharacters/domain/usecase/fetchComicsFromId.dart';

class ComicsDetailsController extends NotifierStore<Exception, List<Comic>> {
  late Future<List<Comic>> future;
  late FetchComicsFromIdUseCase _fetchComicsFromIdUseCase;

  ComicsDetailsController(this._fetchComicsFromIdUseCase) : super([]);

  fetchComicsFromId(int id) async {
    setLoading(true);
    var result = await _fetchComicsFromIdUseCase.fetchComicsFromId(id);
    update(result);
    setLoading(false);
  }
}
