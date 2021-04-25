import 'url.dart';
import 'package:http/http.dart' as http;

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body});

  Future<http.Response> get() {
    return http.get(Uri.parse(mainUrl + url));
  }

  Future<http.Response> post() {
    return http
        .post(Uri.parse(mainUrl + url), body: body)
        .timeout(Duration(minutes: 2));
  }
}
