class User{
  final int id;
  final String email;
  final String password;
  final String username;
  final String telfon;

  User(
    {
      required this.id,
      required this.email,
      required this.password, 
      required this.username,
      required this.telfon
    }
  );

  factory User.fromJson(Map map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      username: map['username'],
      telfon: map['telfon']
    );
  }
}