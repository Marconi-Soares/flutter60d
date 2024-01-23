void main(List<String> args) {
  Function a = A('Marconi');
  a();
}

int first(int a) => a;

bool isOdd(int a) => a.isOdd ? true : false;

void requiredPositional(int a, int b) => print("$a $b");

void optionalPositional([int a = 5, int b = 10]) => print('$a $b');

void requiredNamed({required int a, required int b}) => print('$a $b');

void NamedOptional({int a = 5, int b = 10}) => print('$a $b');

class A {
  final String s;

  A(this.s);

  void call() => print(this.s);
}
