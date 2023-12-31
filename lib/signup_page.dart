import 'package:flutter/material.dart';
import 'package:login_signup_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          height: 50,
                          width: 50,
                          image: AssetImage("images/img.png")),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To-Do-List App",
                            style: TextStyle(
                                fontFamily: "Rubin Medium",
                                color: Color(0xff203142)

                            ),),
                          Text("Box",
                            style: TextStyle(
                                fontFamily: "Rubin Medium",
                                color: Color(0xffF97038)

                            ),),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const Center(child: Text("SignUp",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Rubin Medium",
                        color: Color(0xff203142)),)),
                  const SizedBox(height: 15,),
                  const Center(child: Text("This is login page for open the flutter app,\n and enjoy the app Specification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Rubin Regular",
                        color: Color(0xff4C5980)),)),

                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.contact_page_outlined,color: Color(0xff323F4B),),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: contactController,
                      decoration: InputDecoration(
                        hintText: 'Contact',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.phone_rounded,color: Color(0xff323F4B),),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.email_outlined,color: Color(0xff323F4B),),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.support_agent_outlined,color: Color(0xff323F4B),),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_outline,color: Color(0xff323F4B),),
                        suffixIcon: const Icon(Icons.visibility_off_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),


                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30 ,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Passord",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Color(0xff203142),
                            fontFamily: "Rubik Medium",

                          ),),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50,),

                  GestureDetector(
                    onTap: ()async{
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      sp.setString("name", nameController.text.toString());
                      sp.setString("contact", contactController.text.toString());
                      sp.setString("email", emailController.text.toString());
                      sp.setString("password", passwordController.text.toString());
                      sp.setString("age", ageController.text.toString());


                      if(nameController.text.toString().isNotEmpty &&
                          contactController.text.toString().isNotEmpty &&
                          emailController.text.toString().isNotEmpty &&
                          passwordController.text.toString().isNotEmpty&&
                          ageController.text.toString().isNotEmpty){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill ALl!")));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color(0xffF97038),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                        child: Text("SignUp",style: TextStyle(
                            fontFamily: "Rubik Regular",
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),


                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff203142),
                          fontFamily: "Rubik Regular",
                        ),),
                      GestureDetector(
                        onTap:() {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                        },
                        child: const Text("Login ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Rubik Medium",
                              color: Color(0xffF97038)
                          ),),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}