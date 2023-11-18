import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name="", contact="", email="",password="", age="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDetail();
  }

  void isDetail ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString("name")??"";
    contact = sp.getString("contact")??"";
    email = sp.getString("email")??"";
    password = sp.getString("password")??"";
    age = sp.getString("age")??"";
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange[600],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body:
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
            child: Container(
              height: 400,
              width: 600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orangeAccent,width: 6)
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Name:  ",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Text(name.toString(),style: const TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Email: ",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Text(email.toString(),style: const TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Age: ",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Text(age.toString(),style: const TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Contact:  ",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Text(contact.toString(),style: const TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Password:  ",style: TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Text(password.toString(),style: const TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),

                  ],
                ),
            ),
          ),

    );
  }
}
