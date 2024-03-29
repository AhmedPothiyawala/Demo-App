class User {
  final String name;
  final String phone;
  final String city;
  final String imageUrl;
  int stock;

  String get stockStatus => stock > 50 ? 'High' : 'Low';

  User({
    required this.name,
    required this.phone,
    required this.city,
    required this.imageUrl,
    required this.stock,
  });
}
