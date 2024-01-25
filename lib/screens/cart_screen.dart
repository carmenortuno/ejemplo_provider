import 'package:ejemplo_provider/widget/item_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRODUCTOS"),
      ),
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context,int index)=> ItemCard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}


