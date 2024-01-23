import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejemplo_provider/ui/ui.dart';
import '../providers/login_form_provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext conext) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            );
          },
        ),
        title: Text('APP BAR'),

      ),
      body: Center(
        child: Column(
            children: [
              Text(loginForm.email),
              ElevatedButton(onPressed: (){
                loginForm.updateEmail("carmenortuno@elcampico.org");
                loginForm.password="123456";
              }, child: Text("ACTUALIZAR INFORMACIÓN",style: TextStyleTexto.textoBtn(),),)

            ]
        ),
      ),
    );
  }
}