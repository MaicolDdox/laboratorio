class FernaFlooCarajo {
  final String fullName;
  final String email;
  final String country;
  final String city;
  final String phone;
  final String imageUrl;
  final String gender;


  const FernaFlooCarajo({
    required this.fullName,
    required this.email,
    required this.country,
    required this.city,
    required this.phone,
    required this.imageUrl,
    required this.gender,
  });

  factory FernaFlooCarajo.fromJson(Map<String, dynamic> json){
    final Map<String, dynamic> nameJson = json['name'] as Map<String, dynamic>;
    final Map<String, dynamic> locationJson = json['location'] as Map<String, dynamic>;
    final Map<String, dynamic> pictureJson = json['picture'] as Map<String, dynamic>;

    final String firstName = nameJson['first'] as String;
    final String lastName = nameJson['last'] as String;
    final String fullName = '$firstName $lastName';

    final String country = locationJson['country'] as String;
    final String city = locationJson['city'] as String;

    final String email = json['email'] as String;
    final String phone = json['phone'] as String;

    final String imageUrl = pictureJson['large'] as String;
    final String gender = json['gender'] as String;

    return FernaFlooCarajo(
      fullName: fullName,
      email: email,
      country: country,
      city: city,
      phone: phone,
      imageUrl: imageUrl,
      gender: gender,
    );
  }
}
