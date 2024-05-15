import 'package:flutter/material.dart';

import '../../shared/http/http_client.dart';
import '../../shared/repositories/_export_repositories.dart';

import '../../shared/stores/user_store.dart';

class LojaPage extends StatefulWidget {
  static String routeName = "/LojaPage";
  const LojaPage({Key? key}) : super(key: key);

  @override
  State<LojaPage> createState() => _LojaPageState();
}

class _LojaPageState extends State<LojaPage> {
  final UserStore store = UserStore(
    repository: UserRepository(client: HttpClient()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Loja',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.monetization_on_rounded),
                label: const Text('1500')),
          )
        ],
      ),
    );
  }
}
