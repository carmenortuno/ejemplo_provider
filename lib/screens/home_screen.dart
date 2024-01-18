import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
            children: [
              Text(loginForm.email),
            ]
        ),
      ),
    );
  }
}