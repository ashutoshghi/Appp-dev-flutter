import 'first_design.dart' ;
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController firstNameController= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  String country="nepal";
  String? gender;
  bool agree=false;
  bool ok=false;
  double experience= 15;
  double value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes',style:TextStyle(decorationThickness: 4)),centerTitle: true,),
      drawer: Drawer
      (
       child: ListView
       (
        children: [
          SizedBox(
            height:210,
            child: DrawerHeader
            (
              child:Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  Container
                  (
                    height:80,
                    width:80,
              
                    decoration:BoxDecoration
                    (
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/images/catimageflutter.jpg")),
                    ),
                   
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('aarus rana' ,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color:Colors.blueGrey
                        ),
                        ),
                      Text('aarus.rana@email.com',
                        style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54, 
                    ) 
                  )  
                    ],
                  ),
                   
                ],
                )
            ),
          ),
          ListTile
          (
                  leading:Icon(Icons.settings),
                  title:Text('settings'),
                  onTap:(){
                    Navigator.pop(
                      context
                      );
                  },
            ),

            
             ListTile
             (
                  leading:Icon(Icons.newspaper),
                  title:Text('news', style:  TextStyle(fontSize: 18),),
                  onTap:(){
                    Navigator.pop(context);
                  },
            ),
            ListTile(
              leading:Icon(Icons.favorite),
              title:Text("favorites",style: TextStyle(fontSize:18)),
              onTap:(){
                 Navigator.pop(context);
              }
             ),
             ListTile(
              leading:Icon(Icons.email),
              title:Text("email",style: TextStyle(fontSize:18)),
              onTap:(){
                 Navigator.pop(context);
              }
             ),
              ListTile(
              leading:Icon(Icons.favorite),
              title:Text("my designs",style: TextStyle(fontSize:18)),
              onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFirstPage()));
              }
             )
              
          ],
  
          ),
          
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children:[
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                label: Text('frist name'),
                hintText:'aarus rana',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                )
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                label: Text('email'),
                hintText:'user@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                )
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder
                (
                  borderRadius: BorderRadius.circular(22),
                )
              ),
              items: ['Nepal' , 'India'].map(
                (coun)=> DropdownMenuItem(value :coun,child:Text(coun))
                ).toList(),
             onChanged: (v){
              setState(() {
                country =  v!;
                // v??country
              });
             }
             ),
             Text("gender"),
             RadioGroup(
              groupValue: gender,
              onChanged: (v){
                setState(() {
                  gender= v!;
                });
              }, 
              child: Row
              (
                children: [
                Radio(value: "Male"),
                const Text('Male'),
                Radio(value: "female"),
                const Text('female'),
                ]
              )
              ),
              CheckboxListTile(
              title: Text('do you agree??'),
              value: agree, 
              onChanged: (v){
                setState(() {
                  agree=v!;
                });
              }
              ),
              SwitchListTile(
              value: ok, 
              title: Text('switch on the slide '),
              onChanged: (bool v){
                setState(() {
                  ok=v; }
              );
              }, 
              secondary: Icon(Icons.lock_open_rounded),
              
              ),
              Slider(value: experience, onChanged: (value) {
                setState(() {
                  experience = value;
                });
              })
          ]
        )
      )
      );
  }
}