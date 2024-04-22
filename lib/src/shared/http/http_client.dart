import 'package:http/http.dart' as http;

abstract class IHttpClient {
  get({required String url});
  post({required String url, required String body});
}

class HttpClient implements IHttpClient {
  final client = http.Client();
  @override
  get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  post({required String url, required String body}) async {
    return await client.post(
      Uri.parse(url),
      body: body,
    );
  }
}
