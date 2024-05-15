import 'package:animations/animations.dart';
import 'package:avancao_app/src/shared/http/http_client.dart';
import 'package:avancao_app/src/shared/repositories/user_repository.dart';
import 'package:avancao_app/src/shared/stores/user_store.dart';

import 'package:flutter/material.dart';

import '../../shared/forms/user_form.dart';
import '../../shared/widgets/_export_widgets.dart';

class UserPage extends StatefulWidget {
  static String routeName = "/UserPage";

  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserStore store = UserStore(
    repository: UserRepository(client: HttpClient()),
  );
  final transitionType = ContainerTransitionType.fade;
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    store.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            if (isSearch) {
              setState(() => isSearch = !isSearch);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: isSearch
            ? SizedBox(
                height: 35,
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Pesquisar usuarios',
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              )
            : Text(
                'Usuários',
                style: Theme.of(context).textTheme.titleLarge,
              ),
        actions: [
          Visibility(
            visible: !isSearch,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => setState(() => isSearch = !isSearch),
                icon: const Icon(
                  Icons.search_rounded,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total (${store.state.value.length})',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Row(
                    children: [
                      Text('Nome'),
                      SizedBox(width: 4),
                      Icon(Icons.sort_rounded),
                    ],
                  )
                ],
              ),
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                store.isLoading,
                store.state,
                store.erro,
              ]),
              builder: (context, child) {
                if (store.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (store.erro.value.isNotEmpty) {
                  return const Center(
                    child: Text("Erro de Conexão"),
                  );
                }

                if (store.state.value.isEmpty) {
                  return const Center(
                    child: Text('Nenhum item na lista'),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: store.state.value.length,
                    itemBuilder: (ctx, i) => UserListItem(
                      userModel: store.state.value[i],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: CustomFABWidget(
        transitionType: transitionType,
        route: const UserForm(),
      ),
    );
  }
}
