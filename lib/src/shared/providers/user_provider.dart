import 'package:avancao_app/src/shared/http/exceptions.dart';
import 'package:avancao_app/src/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../models/_export_models.dart';

class UserProvider with ChangeNotifier {
  final IUserRepository repository;

  bool isLoading = false;
  List state = <UserModel>[];

  List get states => <UserModel>[...state];

  String erro = '';
  String get erros => erro;

  UserProvider({required this.repository});

  Future<void> getUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await repository.getUsers();
      state = result;
    } on NotFoundException catch (e) {
      erro = e.msg;
    } catch (e) {
      erro = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
