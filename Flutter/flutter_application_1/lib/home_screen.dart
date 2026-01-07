import 'package:flutter/material.dart';
import 'package:flutter_application_1/first_design.dart';
import 'package:flutter_application_1/second_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _homescreenstate();
}
class _homescreenstate extends State<HomeScreen> {
  final _form=GlobalKey<FormState>();
  final TextEditingController firstNameController= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  final TextEditingController secondNameController= TextEditingController();
  String? country;
  String? gender;
  bool agree=false;
  bool ok=false;
  double experience=10;
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
                      image: DecorationImage(image: AssetImage("assets/images/m5.jpeg")),
                    ),
                   
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ashutosh ghimire' ,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color:Colors.blueGrey
                        ),
                        ),
                      Text('ashutosh.ghimire@email.com',
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
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children:[
              MyTextFormField(controller: firstNameController,hintText: "Enter your first name",label: "First Name",),
              SizedBox(height: 10),
              MyTextFormField(controller: secondNameController,hintText: "Enter your second name",label: "Second Name",),
              SizedBox(height: 10),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return"Please enter your email";
                  }
                  final emailex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if(!emailex.hasMatch(value)){
                    return "please enter a valid email";
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  label: Text('email'),
                  hintText:'user123@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  )
                ),
              ),
              DropdownButtonFormField(
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return"Please select country";
                  }
                  return null;
                },
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
               FormField<String>(
                validator: (value) {
                          if (gender == null || gender!.isEmpty) {
                             return "Please select a gender";
                                  }
                               return null;
                               },
                builder: (FormFieldState<String> state) {
                       return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender"),
                        RadioGroup(
                        groupValue: gender,
                        onChanged: (v) {
                          setState(() {
                            gender = v!;
                            state.didChange(v); 
                          });
                        },
                        child: Row(
                          children: [
                            Radio(value: "Male"),
                            const Text('Male'),
                            Radio(value: "female"),
                            const Text('Female'),
                          ],
                        ),
                      ),

                    ],
                  );
                },
              ),
              FormField<bool>(
                  validator: (value) {
                    if (agree == false) {
                      return "You must agree to continue";
                    }
                    return null;
                  },
                  builder: (FormFieldState<bool> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          title: Text('Do you agree??'),
                          value: agree,
                          onChanged: (v) {
                            setState(() {
                              agree = v!;
                            });
                            state.didChange(v);
                          },
                        ),
                     if (state.hasError)
                      Text(state.errorText!,style: TextStyle(color:Colors.red), ), 
                      ],
                    );
                  },
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
              Text('Experience: ${experience.toInt()} years'),
              Slider(
                value: experience,
                min: 10,
                max: 20,
                divisions: 10,
                label: experience.toInt().toString(),
                onChanged: (v) {
                  setState(() => experience = v);
                },
              ),
             ElevatedButton(
              onPressed: () {
                if (_form.currentState!.validate()) 
                {
                   print("Form is valid");
                  var firstname= firstNameController.text;
                  var secondname= secondNameController.text;
                  var uemail = emailController.text;
                  var ucountry=country??'not select'; //yedi null xa bhane not select
                  var ugender=gender??'not select';
                   print('My name is $firstname');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(firstName: firstname,email:uemail,country:ucountry,gender:ugender),));
                }
                  },
                  child: const Text('Press me'),
                )
            ]
          ),
      
        ),
      )
      );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
  });

  final TextEditingController controller;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if (value==null||value.isEmpty){
        return "enter your full name";
        }
        if (  !value.trim().contains(" ")){
        return "enter your full name";
        }
        return null;
      
      },
      controller: controller,
      decoration: InputDecoration(
        label: Text(' $label'),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
        )
      ),
    );
  }
}