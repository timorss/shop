import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/http_exeption.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegement) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegement?key=AIzaSyCMnonQhdKIn51PFpIOo0pWLdpWtP8xYdo');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != 400) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signin(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
