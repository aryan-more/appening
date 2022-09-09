class User {
  final int id;
  final String fname;
  final String lname;
  final String avatar;
  final String email;
  User({
    required this.id,
    required this.fname,
    required this.lname,
    required this.avatar,
    required this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      fname: map['first_name'] as String,
      lname: map['last_name'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
    );
  }
}
