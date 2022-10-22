import 'package:flutter/material.dart';
import 'package:flutter_log_reg/screens/auth/auth_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
  authentication();
}

Future<void> authentication() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  if (token != null) {
    Get.offAll(const HomeScreen());
    print('token is: $token');
  } else {
    Get.offAll(const AuthScreen());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
