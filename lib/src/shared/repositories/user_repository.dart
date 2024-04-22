import 'dart:convert';

import 'package:avancao_app/src/shared/http/exceptions.dart';
import 'package:avancao_app/src/shared/http/http_client.dart';
import 'package:avancao_app/src/shared/models/user_model.dart';
import 'package:avancao_app/src/shared/utils/constants.dart';

abstract class IUserRepository {
  Future<List<UserModel>> getUsers();
}

class UserRepository implements IUserRepository {
  final IHttpClient client;
  UserRepository({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(url: Constants.userBaseUrl);

    if (response.statusCode == 200) {
      final List<UserModel> users = [];
      final body = jsonDecode(response.body);

      body.forEach((item) {
        final UserModel user = UserModel.fromMap(item);
        users.add(user);
      });

      return users;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os usuários');
    }
  }

  saveUser() async {
    final response = await client.post(
      url: Constants.userBaseUrl,
      body: jsonEncode({
        "nome": '',
        "sobrenome": '',
        "senha": "",
        "email": "",
        "nivel": 0,
        "regime": "1",
        "contrato": "0",
        "ativo": 1,
        "admissao": "2020-03-17",
        "cadastro": "2022-10-24 02:39:50",
        "equipe": "44",
        "cargo": 14,
        "contato": "(99) 9999-9999",
        "dados_sensiveis": 0,
        "equipes_gestor": "0",
        "grupo_de_usuario": 4
      }),
    );

    final body = jsonDecode(response.body);

    return body;
  }
}
