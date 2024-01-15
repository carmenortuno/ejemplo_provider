import 'package:flutter/material.dart';
import 'package:ejemplo_provider/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo Provider',
      initialRoute: 'login',
      routes: {
        'login': ( _ ) => LoginScreen(),
        'home' : ( _ ) => HomeScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromRGBO(234, 249, 200, 1)
      ),
    );
  }
}