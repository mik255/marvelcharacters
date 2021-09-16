import 'package:flutter_test/flutter_test.dart';
import 'package:marvelcharacters/data/model/character/characterModel.dart';
import 'package:marvelcharacters/data/model/character/thumbnailModel.dart';
import 'package:marvelcharacters/data/model/character/comicModel.dart';
import 'package:marvelcharacters/data/repository/characterRepositoryImplementation.dart';
import 'package:marvelcharacters/data/src/characterDataSource.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterDataSource extends Mock implements CharacterDataSource{}
void main(){
    late CharacterRepositoryImplementation repository;
    late CharacterDataSource characterDataSource;
    setUp((){
        characterDataSource = MockCharacterDataSource();
        repository = CharacterRepositoryImplementation(characterDataSource);
    });
    test("shoud return a CharacterModel list", ()async{
        ThumbnailModel characterthumbnailModel =
        ThumbnailModel(extension: 'extension', path: 'path');
        ComicModel comicModel = ComicModel(resourceURI: "resourceURI", name: "name");
        CharacterModel characterModel = CharacterModel(
            id:1,name: "name",characterThumbmailModel: characterthumbnailModel , comicModels: [comicModel], description: 'description');
        List<CharacterModel> characterModels = [characterModel];
        when(()=>characterDataSource.fetchCharactersDataSource(1,1)).thenAnswer((_)async=>characterModels);
        final result =await repository.fetchCharacters(1,1);
        expect(result,characterModels);
        verify(()=>characterDataSource.fetchCharactersDataSource(1,1)).called(1);
    });
}