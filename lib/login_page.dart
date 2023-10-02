import 'package:flutter/material.dart';
import 'package:login_signup_page/signup_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        height: 50,
                        width: 50,
                        image: AssetImage("images/logo.png")),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Maintenance",
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
                const SizedBox(height: 40,),
                const Center(child: Text("Login",
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

                const SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
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

                const SizedBox(height: 100,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const SignUpPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color(0xffF97038),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Text("Login",style: TextStyle(
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
                    const Text("Dont have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff203142),
                        fontFamily: "Rubik Regular",
                      ),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                      },
                      child: const Text("Sign Up ",
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
        )
    );
  }
}