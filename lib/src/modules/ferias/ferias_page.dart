import 'package:avancao_app/src/shared/models/_export_models.dart';
import 'package:flutter/material.dart';

import '../exercicios/exercicios_page.dart';

class FeriasPage extends StatefulWidget {
  static String routeName = "/FeriasPage";

  const FeriasPage({Key? key}) : super(key: key);

  @override
  State<FeriasPage> createState() => _FeriasPageState();
}

class _FeriasPageState extends State<FeriasPage> with TickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> _myTabs = <Tab>[
    Tab(text: 'Exercícios'),
    Tab(text: 'Pedidos'),
    Tab(text: 'Manifestação'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriaModel =
        ModalRoute.of(context)!.settings.arguments as CategoriaModel;

    return DefaultTabController(
      length: _myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            categoriaModel.nome,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: _myTabs,
                isScrollable: true,
                dividerColor: Colors.transparent,
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ExerciciosPage(),
            Text(
              'Exportações 2',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'Exportações 3',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
