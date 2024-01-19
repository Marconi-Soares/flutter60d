import 'package:console_full_project/console_full_project.dart';
import 'package:test/test.dart';
import '../bin/console_full_project.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test("double", () {
    expect(doubleNumber(20), 40);
  });
}
