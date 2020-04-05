import 'package:flutter_test/flutter_test.dart';
import 'package:self_widget/FunctionDart/high_order_function.dart';

main() {
  test('curry', () {
    String good = "Good", evening = "evening";
    String twoNums(String f, String s) => f + s;
    final r = curry(twoNums);
    expect(r(good)(evening), equals(good + evening));
  });
}
