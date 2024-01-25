import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ejemplo_provider/models/product.dart';

class ProductService extends ChangeNotifier{

  final String _baseUrl = '';
  final String _firebaseToken = 'AIzaSyCtmpnjxEAkoQLO68xAkboGo_4oUSR_7yA';
  final List<Product> lista_productos = [];
  bool isLoading = true;
  final storage = new FlutterSecureStorage();

  late Product selectedProduct;
  ProductsService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'productos.json', {
      'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get( url );

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      this.lista_productos.add( tempProduct );
    });


    this.isLoading = false;
    notifyListeners();

    return this.lista_productos;

  }



}