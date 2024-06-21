import 'package:firebase_core/firebase_core.dart';
import 'package:test2ambw/customer/login.dart';
import 'package:test2ambw/others/auth.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'customer/index.dart';
import 'admin/index.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://ydscvaytbbvwrofeojpj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlkc2N2YXl0YmJ2d3JvZmVvanBqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY1NTMyNTgsImV4cCI6MjAzMjEyOTI1OH0.R1YdW0VOhciEb6aO1ljiUT1iZrKilWoEoi4_K9xN_Y8',
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  final Color mainBlue = const Color.fromARGB(255, 3, 174, 210);
  final Color mainYellow = const Color.fromARGB(255, 253, 222, 85);

  final Color mainAmber = HexColor('#FFBF00');

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lexend'),
      // home: HomeCustomer(),
      // home: const AuthPage(),
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/admin': (context) => const AdminPortal(),
      },
    );
  }
}
