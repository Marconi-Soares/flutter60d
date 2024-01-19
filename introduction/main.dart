import 'dart:developer';

void main(List<String> args) {
  debugger();
  printName(args);
  largeIntArr();
}

void printName(List<String> names) {
  names.forEach((name) {
    print(name);
  });
}

void largeIntArr() {
  List<int> arr = [];
  for (var i = 0; i < 1000000; i++) {
    arr.add(i);
  }
}
