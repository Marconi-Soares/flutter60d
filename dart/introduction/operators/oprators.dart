class User {
  final String email;
  final String password;
  final String username;

  User({required this.email, required this.password, required this.username});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && this.email == other.email;
  }

  @override
  int get hashCode => email.hashCode;
}

void compare(User user1, User user2) {
  print("-=" * 20);

  if (user1 == user2)
    print('${user1.username} & ${user2.username}: emails iguais');
  else
    print('${user1.username} & ${user2.username}: emails diferentes');

  print('${user1.username}: ${user1.hashCode}');
  print('${user2.username}: ${user2.hashCode}');
}

void main(List<String> args) {
  User marconi = User(
    username: "marconi",
    email: "marconi@email.com",
    password: "123",
  );

  // mesmo email
  User marconi2 = User(
    username: "marconi2",
    email: "marconi@email.com",
    password: "1234",
  );

  // outro email
  User maria = User(
    username: "maria",
    email: "maria@email.com",
    password: "123",
  );

  compare(marconi, maria);
  compare(marconi, marconi2);
}
