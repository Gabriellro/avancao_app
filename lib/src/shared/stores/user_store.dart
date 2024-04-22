import 'package:avancao_app/src/shared/http/exceptions.dart';
import 'package:avancao_app/src/shared/models/user_model.dart';
import 'package:avancao_app/src/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserStore {
  final IUserRepository repository;
// Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
// Variável reativa para o state

  final ValueNotifier<List<UserModel>> state =
      ValueNotifier<List<UserModel>>([]);

// Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  UserStore({required this.repository});

  Future<void> getUsers() async {
    isLoading.value = true;

    try {
      final result = await repository.getUsers();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.msg;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
