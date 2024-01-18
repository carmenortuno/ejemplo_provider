import 'package:flutter/material.dart';

class TextStyleTexto{
  static TextStyle textoApp(){
    return const TextStyle(
      //color: Color.fromRGBO(254,164,134, 1),
      color: Colors.black,
      fontFamily: 'dm',
      fontWeight: FontWeight.bold,
      fontSize: 18
    );
  }
  static TextStyle textoTitPrincipal(){
    return const TextStyle(
        color: Colors.black,
        fontFamily: 'viga',
        fontSize: 50
    );
  }
  static TextStyle textoBtn(){
    return const TextStyle(
        color: Colors.white,
        fontFamily: 'titan',
        fontSize: 20
    );
  }
}
