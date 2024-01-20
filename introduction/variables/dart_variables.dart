import 'dart:developer';

extension StringExtension on String {
  String toCapitalCase() {
    if (this.length > 1) {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
    if (this.length == 1) {
      return this.toUpperCase();
    }
    return "";
  }
}

void main(List<String> args) {
  // string();
  // boolean();
  list();
}

void string() {
  dynamic wckd = "WCKD!";
  String s1 = 'Hello, WCKD!';
  String s2 = 'Hello, $wckd';
  print(s1.hashCode);
  print(s2.hashCode);
}

void boolean() {
  bool b = true;
  if (b) {
    print('true');
  }

  if (3 > 5) {
    print("3 is greater than 2");
  }

  int a = 5;
  String name = 'WKCD';
  String? passenger;

  if (a != 0) {
    print("a is not zero");
  }
  if (name != "") {
    print("name is not empty");
  }
  // ignore: unnecessary_null_comparison
  if (passenger != null) {
    print('passenger is not null');
  }
}

void list() {
  List<int> list = [1, 2, 3];
  print(list);
  List<bool> boolean = [true, true, false];
  List<Object?> complexList = [2, 3, 2.0, 5, 'hey', true, null];
  print(complexList);
  print(boolean);

  debugger();
  const males = ['marconi', 'marcio', 'marcilio', 'mario', '', 'm'];
  const females = ['maria', 'marcela', 'margarida', 'marcelina'];

  const onlyMales = true;

  List<String> collectionIf = [
    for (var male in males) male.toCapitalCase(),
    if (onlyMales)
      // ignore: dead_code
      for (var female in females) female.toCapitalCase(),
  ];
  print(collectionIf);
}
