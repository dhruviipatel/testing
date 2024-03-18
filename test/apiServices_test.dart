import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_app/logic/apiServices.dart';
import 'package:testing_app/models/userModel.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late ApiServices apiservice;
  late MockHttpClient mockhttpclient;
  setUp(() {
    mockhttpclient = MockHttpClient();
    apiservice = ApiServices(mockhttpclient);
  });
  group('ApiService Test - ', () {
    group('Get User Data Test - ', () {
      test(
          'getUserData function is called and give statuscode 200 and return todoModel',
          () async {
        //arrange
        when(() => mockhttpclient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')))
            .thenAnswer((invocation) async {
          return Response('''
                 {
                    "userId": 1,
                    "id": 1,
                    "title": "delectus aut autem",
                    "completed": false
                  }
              ''', 200);
        });
        //action
        final user = await apiservice.getTodoData();
        //asserrt
        expect(user, isA<TodoModel>());
      });

      test(
          'getUserData function is called and not give statuscode 200 then throw exception',
          () async {
        //arrange
        when(
          () => mockhttpclient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')),
        ).thenAnswer((invocation) async => Response('{}', 500));
        //action
        final user = apiservice.getTodoData();
        //assert
        expectLater(user, throwsException);
      });
    });
  });
}
