import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing_app/models/commentModel.dart';

class ApiRepo {
  final http.Client myhttp;
  ApiRepo(this.myhttp);

  Future<CommentModel> getCommentData() async {
    var res = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/1'));
    if (res.statusCode == 200) {
      var comment = jsonDecode(res.body);
      return CommentModel.fromJson(comment);
    } else {
      throw Exception('Some error in getting commentd data');
    }
  }

  Future<List<CommentModel>> getCommentList() async {
    var res = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (res.statusCode == 200) {
      List resbody = jsonDecode(res.body);
      List<CommentModel> cmtList =
          resbody.map((e) => CommentModel.fromJson(e)).toList();
      return cmtList;
    } else {
      throw Exception('Some error in getting commentList');
    }
  }
}
