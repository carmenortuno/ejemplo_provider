import 'dart:convert';

class Product{
  Product({ required this.id,
    required this.nombre,
    required this.precio,
  });
  String nombre;
  String id;
  double precio;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    nombre: json["nombre"],
    precio: json["precio"],
    id: json["id"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "precio": precio,
    "id": id,
  };


}