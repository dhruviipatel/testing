import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_app/logic/apirepo.dart';
import 'package:testing_app/models/commentModel.dart';

class MockhttpClient extends Mock implements Client {}

void main() {
  late ApiRepo apirepo;
  late MockhttpClient mockhttpclient;

  setUp(() {
    mockhttpclient = MockhttpClient();
    apirepo = ApiRepo(mockhttpclient);
  });
  group('Api Repo Test -', () {
    group('Get Comment function Test', () {
      test('get comment data with statuscode 200 and return commentModel',
          () async {
        //Arrange
        when(() => mockhttpclient.get(
                Uri.parse('https://jsonplaceholder.typicode.com/comments/1')))
            .thenAnswer((invocation) async {
          return Response('''
                    {
                      "postId": 1,
                      "id": 1,
                      "name": "id labore ex et quam laborum",
                      "email": "Eliseo@gardner.biz",
                      "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\\ntempora quo necessitatibus\\ndolor quam autem quasi\\nreiciendis et nam sapiente accusantium"
                    }
             ''', 200);
        });
        //Action
        var comment = await apirepo.getCommentData();
        //Asset
        expect(comment, isA<CommentModel>());
      });

      test(
          'get comment data where status code is not equal to 200 then throw exception',
          () async {
        //arrange
        when(() => mockhttpclient.get(
                Uri.parse('https://jsonplaceholder.typicode.com/comments/1')))
            .thenAnswer((invocation) async => Response('{}', 500));
        //action
        var comment = apirepo.getCommentData();

        //asset
        await expectLater(comment, throwsException);
      });
    });

    group('Get Comment List Test -', () {
      group('Get Comment List function Test - ', () {
        test('get status code 200 and return comment list', () async {
          //arrange
          final List<dynamic> commentresponselist = [
            {
              "postId": 101,
              "id": 11,
              "name": "id labore",
              "email": "Eliseo@gardner.biz",
              "body":
                  "tatibus\\ndolor quam autem quasi\\nreiciendis et nam sapiente accusantium"
            },
            {
              "postId": 123,
              "id": 2,
              "name": "quo vero reiciendis velique earum",
              "email": "Jayne_Kuhic@sydney.com",
              "body":
                  "euod ullam at\\nvoluptatem error expedita pariatur\\nnihil sint nostrum voluptatem reiciendis et"
            },
          ];

          when(() => mockhttpclient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/comments')))
              .thenAnswer((invocation) async =>
                  Response(json.encode(commentresponselist), 200));

          //action
          final commentlist = await apirepo.getCommentList();
          //asset
          expect(commentlist, isA<List<CommentModel>>());
          expect(commentlist.length, commentresponselist.length);

          for (var i = 0; i < commentlist.length; i++) {
            expect(commentlist[i], isA<CommentModel>());
          }
        });

        test('get status code 200 and get empty list', () async {
          //arrange
          when(() => mockhttpclient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/comments')))
              .thenAnswer((invocation) async => Response('[]', 200));
          //action
          final cmtlist = await apirepo.getCommentList();

          //assets
          expect(cmtlist, isA<List<CommentModel>>());
          expect(cmtlist.isEmpty, true);
        });

        test('get status code is not 200 then throw exception', () async {
          //arrange
          when(() => mockhttpclient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/comments')))
              .thenAnswer((invocation) async => Response('{}', 500));
          //action
          final list = apirepo.getCommentList();
          //assets
          expect(list, throwsException);
        });
      });
    });
  });
}
