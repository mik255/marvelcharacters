
import 'package:dio/dio.dart';
import 'package:marvelcharacters/core/httpClient/httpClient.dart';

class DioImplementation implements HttpClient{
  @override
  Future<HttpClientResponse> get(String urlPath) async{
    var response = await Dio().get(urlPath);
    return HttpClientResponse(data: response.data,statusCode: response.statusCode);
  }

}