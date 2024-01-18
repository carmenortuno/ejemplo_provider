import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<String> _listaAlbum = [];
  get listaAlbum => _listaAlbum;
  void add(String album){
    _listaAlbum.add(album);
    notifyListeners();
  }

  void remove(String album){
    _listaAlbum.remove(album);
    notifyListeners();
  }

}
