class MyUser {
  static const String usersCollectionName = 'Users';
  String id;
  String email;
  String name;
  String? image;

  MyUser(
      {required this.id, required this.email, required this.name, this.image});

  MyUser.fromFirestore(Map<String, dynamic> data)
      : this(id: data['id'],
      name: data['name'],
      email: data['email'],
      image: data['image']);

  Map<String, dynamic> toFirestore() {
    return {'id': id, 'email': email, 'name': name, 'image': image};
  }
}
