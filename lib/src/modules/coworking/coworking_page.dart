import 'package:flutter/material.dart';

import 'estacoes_trabalho_page.dart';
import 'salas_reunioes_page.dart';
import 'estacionamento_page.dart';
import 'historico_page.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class CoworkingPage extends StatefulWidget {
  static String routeName = "/CoworkingPage";
  const CoworkingPage({Key? key}) : super(key: key);

  @override
  State<CoworkingPage> createState() => _CoworkingPageState();
}

class _CoworkingPageState extends State<CoworkingPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;

  bool isChecked = true;
  bool repetirAagendamento = true;

  static const List<Tab> _myTabs = <Tab>[
    Tab(text: 'Estações de Trabalho'),
    Tab(text: 'Salas de Reuniões'),
    Tab(text: 'Estacionamento'),
    Tab(text: 'Histórico'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _tabController2 = TabController(length: 4, vsync: this);
    _tabController2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  DateTime _selectedDay = DateTime.now();

  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    // final start = dateRange.start;
    // final end = dateRange.end;
    return DefaultTabController(
      length: _myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          elevation: 0,
          leadingWidth: isSearch ? 50 : 0,
          leading: Visibility(
            visible: isSearch,
            child: IconButton(
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
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: isSearch
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    'Coworking',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
          ),
          actions: [
            Visibility(
              visible: _tabController.index == 3 && !isSearch,
              child: IconButton(
                onPressed: () => setState(() => isSearch = !isSearch),
                icon: const Icon(Icons.search_rounded),
              ),
            ),
            Visibility(
              visible: _tabController.index != 3,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.layers_rounded),
              ),
            ),
            Visibility(
              visible: !isSearch,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_outline_rounded),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Visibility(
              visible: !isSearch,
              child: Container(
                height: 64,
                width: double.infinity,
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  tabs: _myTabs,
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  indicatorPadding: const EdgeInsets.only(top: 5, bottom: 7),
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  labelColor: Theme.of(context).colorScheme.onPrimary,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  splashBorderRadius:
                      const BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
            Visibility(
              visible: _tabController.index != 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: WeeklyDatePicker(
                  selectedDay: _selectedDay,
                  changeDay: (value) => setState(() {
                    _selectedDay = value;
                  }),
                  enableWeeknumberText: false,
                  weekdayTextColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  weeknumberTextColor: Theme.of(context).colorScheme.onSurface,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerLowest,
                  digitsColor: Theme.of(context).colorScheme.onSurface,
                  selectedDigitColor: Theme.of(context).colorScheme.onPrimary,
                  selectedDigitBackgroundColor:
                      Theme.of(context).colorScheme.primary,
                  weekdays: const ["S", "T", "Q", "Q", "S", "S", "D"],
                  daysInWeek: 7,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: const [
                  EstacoesTrabalhoPage(),
                  SalasReunioesPage(),
                  EstacionamentoPage(),
                  HistoricoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
