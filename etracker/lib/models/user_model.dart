class User {
  final String fullName;
  final int id;
  final String companyName;
  final int phone;
  final int countryPrefix;
  final String address;
  final int active;

  const User({
    required this.companyName,
    required this.phone,
    required this.countryPrefix,
    required this.address,
    required this.fullName,
    required this.id,
    required this.active,
  });

  String get phoneNumber {
    return '+$countryPrefix$phone';
  }

  String get firstName {
    final strings = fullName.split(' ');
    return strings[0];
  }
}
