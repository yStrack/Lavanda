class User {
  final String email;
  final String password;
  final String name;
  final String image;
  final String imageUrl;
  final List location;

  User(
      {this.email,
      this.password,
      this.name,
      this.image,
      this.imageUrl,
      this.location});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'image': image,
      'imageUrl': imageUrl,
      'location': location,
    };
  }
}
