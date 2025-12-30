import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ashutosh Flutter App Dev',
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              // height: 50, // Removed this as it is a multiplier and was too large
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 10, 10),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color.fromARGB(255, 237, 218, 9),
                height: 40,
              ),
              const SizedBox(height: 10),
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/images.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Color.fromARGB(255, 180, 63, 9),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color.fromARGB(255, 237, 218, 9),
                height: 40,
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/Images/images.jpg",
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
              const SizedBox(height: 10),
              
              // ListView inside Column needs shrinkWrap: true
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(height: 300, width: 200, color: Colors.blue),
                  const SizedBox(height: 10),
                  Container(height: 300, width: 200, color: Colors.black12),
                  const SizedBox(height: 10),
                  Container(height: 300, width: 200, color: Colors.yellowAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}