

abstract class HttpClient{
  Future<HttpClientResponse> get(String urlPath);
}

class HttpClientResponse{
  final String data;
  final int? statusCode;

  HttpClientResponse({required this.data,required this.statusCode});
}