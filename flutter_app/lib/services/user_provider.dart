import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];
  bool _loading = false;
  String? _error;

  List<UserModel> get users => _users;
  bool get loading => _loading;
  String? get error => _error;

  final String _baseUrl = 'http://localhost:8000/api/users';

  Future<void> fetchUsers() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(response.body);
        _users = jsonList.map((e) => UserModel.fromJson(e)).toList();
      } else {
        _error = 'Erro ao carregar usuários: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Erro de rede: $e';
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> createUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        final createdUser = UserModel.fromJson(jsonDecode(response.body));
        _users.add(createdUser);
        notifyListeners();
      } else {
        throw Exception('Erro ao criar usuário: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de rede ao criar usuário: $e');
    }
  }

  Future<UserModel?> getUser(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Erro ao obter usuário: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de rede ao obter usuário: $e');
    }
  }
}
