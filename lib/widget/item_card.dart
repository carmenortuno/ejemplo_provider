
import 'package:ejemplo_provider/ui/tema_app.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_provider/ui/ui.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child:Container(
      width: double.infinity,
      height: 50,
      decoration: TemaApp.bordes(),
      child: Stack(
        children: [
          _BlackgroundImage(),
          Container(
            width: double.infinity/2,
            height: 20,
            color: Colors.white,
          ),
          Text("Texto"),
          TextButton(onPressed: (){}, child: Text("Clic"))
        ],
      ),

    ) ,);
  }
}
class _BlackgroundImage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Container(
        color: Colors.deepOrangeAccent,
      );

    }
}


