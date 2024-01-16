import 'package:flutter/material.dart';

class TextStyleTexto{
  static TextStyle textoApp(){
    return const TextStyle(
      color: Color.fromRGBO(254,164,134, 1),
      fontFamily: 'dm',
      fontSize: 22
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
