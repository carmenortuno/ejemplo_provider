import 'package:flutter/material.dart';


class InputDecorations {

  //Maneja propiedades estáticas para no instanciar.
  static InputDecoration loginInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.greenAccent
          ),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 2
            )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
            color: Colors.grey
        ),
        prefixIcon: prefixIcon != null
            ? Icon( prefixIcon, color: Colors.greenAccent )
            : null
    );
  }

}