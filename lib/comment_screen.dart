import 'package:flutter/material.dart';
import 'package:testing_app/logic/apirepo.dart';
import 'package:testing_app/models/commentModel.dart';
import 'package:http/http.dart' as http;

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final ApiRepo apirepo = ApiRepo(http.Client());
  late Future<List<CommentModel>> getCommentList;
  @override
  void initState() {
    getCommentList = apirepo.getCommentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Testing Demo'),
      ),
      body: FutureBuilder(
          future: getCommentList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${data?[index].name}'),
                );
              });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Container();
            }
          }),
    );
  }
}
