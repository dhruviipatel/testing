import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_app/models/userModel.dart';

class ApiServices {
  final http.Client myhttp;
  ApiServices(this.myhttp);

  Future<TodoModel> getTodoData() async {
    var res = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      return TodoModel.fromJson(body);
    } else {
      throw Exception("Something went wrong");
    }
  }

  //Future<List<User>>
}
