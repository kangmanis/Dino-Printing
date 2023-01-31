import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/home_screen.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dino_printing/router/routes.dart';
import 'package:dino_printing/screens/profile_screen.dart';
import 'package:dino_printing/screens/signin_screen.dart';
 
void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  static const String _title = 'Printing Online Service App';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino Printing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SignInScreen(),
        routes: {
          //Routes.orderForm: (context) => const orderForm(),
          //Routes.userData: (context) => const userData(),
          Routes.profile: (context) => const UserProfile(),
          //Routes.location: (context) => const location(),
          Routes.homeScreen: (context) => const HomeScreen()
        });
  }
}