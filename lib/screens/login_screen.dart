import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejemplo_provider/ui/input_decorations.dart';
import 'package:ejemplo_provider/widget/login_background.dart';
import 'package:ejemplo_provider/widget/card_container.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox( height: 250 ),
                  CardContainer(
                      child: Column(
                        children: [
                          SizedBox( height: 10 ),
                          Text('Login', style: Theme.of(context).textTheme.headline4 ),
                          SizedBox( height: 30 ),

                        ],
                      )
                  ),

                  SizedBox( height: 50 ),
                  Text('Crear una nueva cuenta', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ),),
                  SizedBox( height: 50 ),
                ],
              ),
            )
        )
    );
  }
}


class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();

    return Container(
      child: Form(
        //key: loginForm.formKey,
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.loginInputDecoration(
                  hintText: 'email@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded
              ),
           
              onChanged: (value) =>{},
              validator: ( value ) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Email incorrecto';

              },
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.loginInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline
              ),
             // onChanged: ( value ) => loginForm.password = value,
              onChanged: (value) => { print (value)},
              validator: ( value ) {

                return ( value != null && value.length >= 6 )
                    ? null
                    : 'La contraseña debe tener más de 5 caracteres';

              },
            ),

            SizedBox( height: 30 ),

            MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                    child: Text(
                      "ENTRAR",
                      style: TextStyle( color: Colors.white ),
                    )
                ),
                onPressed:
                    ()=>{

                  // TODO: validar si el login es correcto
                  Navigator.pushReplacementNamed(context, 'home')
                }
            )

          ],
        ),
      ),
    );
  }
}
