import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/data/dummy_data.dart';
import '../../shared/http/http_client.dart';
import '../../shared/repositories/_export_repositories.dart';
import '../../shared/stores/app_store.dart';
import '../../shared/stores/user_store.dart';
import '../../shared/widgets/_export_widgets.dart';

class MenuPage extends StatefulWidget {
  static String routeName = "/MenuPage";
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final UserStore store = UserStore(
    repository: UserRepository(client: HttpClient()),
  );
  @override
  void initState() {
    super.initState();
    store.getUsers();
  }

  int currentPageIndex = 0;

  void _bottomSheetSair(context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (BuildContext bc) {
        return const BottomSheetSair();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppStore appStore = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 40,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      'GR',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Gabriel Ribeiro",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UX Designer",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF46464F),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "02/09/2019",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Departamento Pessoal',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dummyCategorias.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (ctx, i) => CategoriaItem(
                      categoriaModel: dummyCategorias[i],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Admin',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dummyAdmCategorias.length,
                      itemBuilder: (ctx, i) => InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: dummyAdmCategorias[i].icon,
                          title: Text(dummyAdmCategorias[i].nome),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              dummyAdmCategorias[i].routePage,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tema',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RadioListTile<ThemeMode>(
                          enableFeedback: true,
                          value: ThemeMode.system,
                          groupValue: appStore.themeMode,
                          title: const Text('Automático (Sistema)'),
                          onChanged: (ThemeMode? value) {
                            appStore.switchTheme(value);
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          enableFeedback: true,
                          value: ThemeMode.light,
                          groupValue: appStore.themeMode,
                          title: const Text('Claro'),
                          onChanged: appStore.switchTheme,
                        ),
                        RadioListTile<ThemeMode>(
                          enableFeedback: true,
                          value: ThemeMode.dark,
                          groupValue: appStore.themeMode,
                          title: const Text('Escuro'),
                          onChanged: appStore.switchTheme,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () => _bottomSheetSair(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Sair da Conta',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
