class MyForm {
  String? firstName;
  final String email;
  final String country;
  final String gender;
  final bool agree;
  final bool? notification;

  MyForm({
    this.firstName,
    required this.email,
    required this.gender,
    required this.country,
    required this.agree,
    this.notification,
  });
}

