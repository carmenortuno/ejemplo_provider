import 'package:ejemplo_provider/providers/cart_provider.dart';
import 'package:ejemplo_provider/providers/login_form_provider.dart';
import 'package:ejemplo_provider/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_provider/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(gesApp());

class gesApp extends StatelessWidget {
  const gesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ )=>LoginFormProvider()),
          ChangeNotifierProvider(create: ( _ )=>CartProvider()),
          ChangeNotifierProvider(create: ( _ )=>AuthService())
        ],
      child: MyApp(),);
  }
}


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
        'cart' : ( _ ) => CartScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromRGBO(234, 249, 200, 1)
      ),
    );
  }
}