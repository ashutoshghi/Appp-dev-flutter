import 'package:flutter/material.dart';
class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'KEC App',

            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Press Me')),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Press Me 2'),
        
                    Icon(Icons.settings_ethernet),
                  ],
                ),
              ),
        
              TextButton(onPressed: () {}, child: Text('Login')),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFirstPage()));
                  Text('Press me again');
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(12),
        
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
        
                  child: Text('Login Free'),
                ),
              ),
        
              SizedBox(height: 10),
              Container(color: Colors.pinkAccent, height: 10, width: 30),
              SizedBox(height: 10),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(40),
                  height: 300,
                  width: 300,
        
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      //change image path
                      image: AssetImage('assets/images/m5.jpeg'),
                    ),
                    // borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("data", style: TextStyle(color: Colors.red)),
                      Icon(Icons.search_off, size: 100),
                    ],
                  ),
                ),
              ),
              ClipRRect(child: Image.asset("assets/images/m5.jpeg")),
              Image.network(
                'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
        
              SizedBox(
                height: 1000,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(height: 300, width: 200, color: Colors.amber),
                    Container(height: 300, width: 200, color: Colors.red),
                    Container(height: 300, width: 200, color: Colors.pink),
                  ],
                ),
              ),
              SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      height: 300,
                      width: 200,
                      color: Colors.amberAccent,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }
}