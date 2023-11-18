import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_page/signup_page.dart';

import 'package:login_signup_page/task_list_screen.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskListModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: LoginPage(),
    ),
    );
  }
}


