import 'package:ejemplo_provider/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_provider/providers/login_form_provider.dart';
import 'package:ejemplo_provider/ui/input_decorations.dart';
import 'package:ejemplo_provider/ui/textstyle_texto.dart';
import 'package:ejemplo_provider/widget/login_background.dart';
import 'package:ejemplo_provider/widget/card_container.dart';
import 'package:provider/provider.dart';

//El provider puede ponerse en diferente puntos, main, etc. Pero como sólo
// va a usarse en LoginForm, lo colocamos en LoginScreen

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
                          Text('Login', style: TextStyleTexto.textoTitPrincipal()),
                          SizedBox( height: 30 ),
                          _LoginForm()
                        ],
                      )
                  ),

                  SizedBox( height: 50 ),
                  Text('Crear una nueva cuenta', style: TextStyleTexto.textoApp(),),
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

    //Creo una instancia del provider para el formulario, y trabajo a través de ella
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formkey,
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
              onChanged: ( value ) => loginForm.email = value,
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
              onChanged: ( value ) => loginForm.password = value,
              validator: ( value ) {

                  return (value!=null && value.length>=5) ?null : "La contraseña debe tener al menos 5 caracteres";

              },
            ),

            SizedBox( height: 30 ),

            MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.greenAccent,
                child: Container(
                    padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                    child: Text(
                      "ENTRAR",
                      style: TextStyle( color: Colors.white ),
                    )
                ),
                onPressed:  () async{
                  print("PULSAR");
                  //Se pone la escucha a false, porque no se puede escuchar dentro de un método
                  //sólo funciona la escucha en los View
                   final authService = Provider.of<AuthService>(context,listen: false);

                    //Si las validaciones no son correctas vuelve
                    if(!loginForm.isValidForm()) return;
                    //loginForm.isLoading = true;

                  final String? error= await authService.login(loginForm.email, loginForm.password);
                    print(error);
                    if(error == null ){
                      Navigator.pushReplacementNamed(context, 'home');
                    }
                    else{
                      //TODO mostrar error en pantalla
                    }


                  }

            )

          ],
        ),
      ),
    );
  }
}