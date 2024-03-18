import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/logic/counter.dart';

void main() {
  late Counter counter;
  setUp(() {
    counter = Counter();
  });
  // setUpAll(() => null);
  // tearDown(() => null);
  // tearDownAll(() => null);

  //setup called before every test
  //setupAll called before all tests

  //tearDown called after every test
  //tearDownAll called after all tests

  group('this is for counter test', () {
    test('check that initial value of count is 0', () {
      //apply Arrange, Act, Assert format for every test

      //Arrange
      //final Counter counter =Counter()
      //Act
      var val = counter.count;
      //Assert
      expect(val, 0);
    });

    test('check after click on increamet button value of count should be 1',
        () {
      counter.incrementCount();
      var val = counter.count;
      expect(val, 1);
    });

    test('check after click on increamet button value of count should be -1',
        () {
      counter.decrementCount();
      var val = counter.count;

      expect(val, -1);
    });

    test('check after click on reset button value of count should be 0', () {
      counter.resetCount();
      var val = counter.count;
      expect(val, 0);
    });
  });
}
