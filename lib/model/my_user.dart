class MyUser {
  static const String usersCollectionName = 'Users';
  String id;
  String email;
  String name;

  MyUser({required this.id, required this.email, required this.name});

  MyUser.fromFirestore(Map<String, dynamic> data)
    : this(id: data['id'], name: data['name'], email: data['email']);

  Map<String, dynamic> toFirestore() {
    return {'id': id, 'email': email, 'name': name};
  }
}
