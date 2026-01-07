import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String firstName;
  final String email;
  final String country;
  final String gender;
  const SecondScreen({
    super.key,
    required this.firstName,
    required this.email,
    required this.country,
    required this.gender,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Text('full name: $firstName email: $email country: $country gender :$gender'),
      )
    );
  }
}