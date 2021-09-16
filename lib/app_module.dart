import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelcharacters/domain/usecase/characterUsecase.dart';
import 'package:marvelcharacters/presenter/controller/homeController.dart';
import 'core/httpClient/dioImplementation.dart';
import 'data/repository/characterRepositoryImplementation.dart';
import 'data/src/characterDataSourceImplementation.dart';
import 'domain/usecase/fetchComicsFromId.dart';
import 'presenter/controller/comicsDetailsController.dart';
import 'presenter/views/startPage.dart';


class AppModule extends Module {

  @override
  final List<Bind> binds = [
    Bind((i)=>CharacterUseCase(i())),
    Bind((i)=>FetchComicsFromIdUseCase(i())),
    Bind((i)=>CharacterDataSourceImplementation(i())),
    Bind((i)=>CharacterRepositoryImplementation(i())),
    Bind((i)=>DioImplementation()),
    Bind((i)=>HomeController(i())),
    Bind((i)=>ComicsDetailsController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_,__)=>StartPage()),
  ];

}