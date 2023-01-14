import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://us-central1-vogium.cloudfunctions.net/";

  Future fetchInfo() async {
    var response = await http.get(Uri.parse("${baseUrl}fetchInfo"));
    print(response.body);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data["username"]);
  }

  Future fetchZort() async {
    var response = await http.get(Uri.parse("${baseUrl}fetchPosts"));
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data["posts"][0]);
  }
}
