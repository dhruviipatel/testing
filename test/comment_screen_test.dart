import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/comment_screen.dart';

void main() {
  testWidgets('comment screen ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CommentScreen(),
    ));

    // var find1 = find.byType(CircularProgressIndicator);
    // expect(find1, findsOneWidget);
  });
}
