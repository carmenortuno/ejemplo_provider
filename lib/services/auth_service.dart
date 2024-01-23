import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'https://identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCtmpnjxEAkoQLO68xAkboGo_4oUSR_7yA';

  final storage = new FlutterSecureStorage();


/*
  Future<String?> register( String email, String password ) async {

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    Uri.parse(Uri.encodeFull("https://identitytoolkit.googleapis.com/v1/accounts:signUp"));

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }

  }*/
//LOGIN
  Future<String?> login( String email, String password ) async {

    print("LOGIN");
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken');

   // final url = Uri.https("identitytoolkit.googleapis.com/v1/key=AIzaSyCtmpnjxEAkoQLO68xAkboGo_4oUSR_7yA");

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('idToken') ) {
      print(decodedResp['idToken']);
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }

  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {

    return await storage.read(key: 'token') ?? '';

  }

}