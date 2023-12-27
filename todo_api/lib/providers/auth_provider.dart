import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api/models/user.dart';
import 'package:todo_api/services/auth_service.dart';

class AuthPovider extends ChangeNotifier {
  final authService = AuthService();
  String token = '';

  Future<String> signup({required User user}) async {
    token = await AuthService().signup(user: user);
    notifyListeners();
    return token;
  }

  Future<String> signin({required User user}) async {
    token = await AuthService().signin(user: user);
    notifyListeners();
    return token;
  }

  // Save token in storage
  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", token);
  }

  // Read token from storage
  readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? ''; // ?? null check operator
    notifyListeners();
  }
}
