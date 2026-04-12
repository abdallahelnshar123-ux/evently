class MyUser {
  static const String usersCollectionName = 'Users';
  String id;
  String email;
  String name;
  String provider;

  MyUser({
    required this.id,
    required this.email,
    required this.name,
    required this.provider,
  });

  MyUser.fromFirestore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        provider: data['provider'],
      );

  Map<String, dynamic> toFirestore() {
    return {'id': id, 'email': email, 'name': name, 'provider': provider};
  }
}
