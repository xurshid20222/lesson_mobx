import 'dart:convert';
import 'package:http/http.dart';

import '../model/post_model.dart';


class NetworkService {
  static String BASE = "62b6a84142c6473c4b4619ad.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */
  static String API_LIST = "/post";
  static String API_CREATE = "/post";
  static String API_UPDATE = "/post/"; // {ID}
  static String API_DELETE = "/post/"; // {ID}

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api); // http or https
    print('-------------------------------------------------');
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */
  static Map<String, dynamic> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> paramsCreate(Post post) {
    Map<String, dynamic> params = {};
    params.addAll({
      'id': post.id,
      'title': post.title,
      'body': post.body,
      'userId': post.userId,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id,
      'title': post.title,
      'body': post.body,
      'userId': post.userId,
    });
    return params;
  }

  /* Http Parsing */
  static List<Post> parsePostList(String response) {
    var json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

}