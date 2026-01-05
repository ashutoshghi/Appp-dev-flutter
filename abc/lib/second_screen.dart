import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String firstName;
  const SecondScreen({super.key,required this.firstName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Text(firstName)
      ),
    );
  }
}