import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/counter_screen.dart';

void main() {
  //pumpwidget restart or initialize app again
  testWidgets(
      'counter screen value initially should be 0 and after click on button it should be 1',
      (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: CounterScreen(title: 'Counter Demo')));

    var appbar = find.byType(AppBar);
    expect(appbar, findsOneWidget);

    var countvalue = find.text('0');
    expect(countvalue, findsOneWidget);

    var countvalue1 = find.text('1');
    expect(countvalue1, findsNothing);

    var incrflot = find.byKey(const Key('_incrementCounter'));
    await tester.tap(incrflot);

    await tester.pump();

    var countvalue2 = find.text('1');
    expect(countvalue2, findsOneWidget);

    var countvalue3 = find.text('0');
    expect(countvalue3, findsNothing);

    var decflot = find.byKey(const Key('_decrementCounter'));
    await tester.tap(decflot);

    await tester.pump();

    var countvalue4 = find.text('0');
    expect(countvalue4, findsOneWidget);
  });
}
