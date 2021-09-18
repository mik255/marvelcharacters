import 'package:flutter_test/flutter_test.dart';
import 'package:marvelcharacters/core/endpoints/endpoints.dart';
import 'package:marvelcharacters/core/httpClient/httpClient.dart';
import 'package:marvelcharacters/data/src/characterDataSource.dart';
import 'package:marvelcharacters/data/src/characterDataSourceImplementation.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/fixtures/fixture_reader.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late CharacterDataSource characterDataSource;
  late HttpClient httpClient;
  setUp(() {
    httpClient = HttpClientMock();
    characterDataSource = CharacterDataSourceImplementation(httpClient);
  });
  test('should call the get method with correct url', () async {
    String response = fixture('marvelCharacterResponse.json');
    var dataResult = HttpClientResponse(statusCode: 200, data: response);
    var endpoint = charactersEndpoint(limit: 1, offset: 1);
    when(() => httpClient.get(endpoint)).thenAnswer((_) async => dataResult);
    await characterDataSource.fetchCharactersDataSource(1, 1);
    verify(() => httpClient.get(endpoint)).called(1);
  });
  test('should throw a error when the call is unccessful', () {
    when(() => httpClient.get(any())).thenThrow(new ArgumentError());
    final result = characterDataSource.fetchCharactersDataSource(1, 1);
    expect(() => result, throwsArgumentError);
  });
}
