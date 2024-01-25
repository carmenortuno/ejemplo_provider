import 'package:flutter/material.dart';

class TemaApp{
  static ThemeData tema(){
    return ThemeData.light().copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.lightGreen
      ),
    );
  }
  static BoxDecoration bordes(){
    return BoxDecoration(
      color: Colors.lightGreen,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(
        color: Colors.white,
        offset: Offset(0,3),
        blurRadius: 4
      )]
    );

  }
}