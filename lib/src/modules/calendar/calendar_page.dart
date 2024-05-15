import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:async';

import '../../shared/models/_export_models.dart';
import '../../shared/utils/faker_api.dart';

bool load = false;
List<AppEvent> events = [];

var kNow = DateTime.now();
var kFirstDay = DateTime(kNow.year, kNow.month - 12, kNow.day);
var kLastDay = DateTime(kNow.year, kNow.month + 12, kNow.day);

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  _CalendarPageState();

  LinkedHashMap<DateTime, List<AppEvent>>? _groupedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    addSchedules();
  }

  //Função auxiliar para o LinkedHashMap
  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  //Adiciona os eventos em Map (LinkedHashMap)
  _groupEvents(List<AppEvent> events) {
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (var event in events) {
      DateTime date = DateTime.utc(
          event.date!.year, event.date!.month, event.date!.day, 12);
      if (_groupedEvents![date] == null) _groupedEvents![date] = [];
      _groupedEvents![date]!.add(event);
    }
  }

  //Obtém os eventos de dia determinado
  List<dynamic> _getEventsForDay(DateTime date) {
    return _groupedEvents?[date] ?? [];
  }

  ///Função para adcionar os horários ao calendário.
  Future addSchedules() async {
    await FakerApi.getData().then((schedules) {
      events.clear();
      for (var i = 0; i < schedules.length; i++) {
        events.add(AppEvent(
            date: DateTime.parse(schedules[i].birthday),
            title: schedules[i].firstname));
      }
      setState(() {
        load = true;
      });
    });
    _groupEvents(events);
  }

  @override
  Widget build(BuildContext context) {
    if (load == false) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Agenda',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  DateFormat("d").format(DateTime.now()),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime.now();
                    });
                  },
                  icon: const Icon(
                    Icons.check_box_outline_blank_rounded,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Agenda',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    DateFormat("d").format(DateTime.now()),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        //aq posso unir as duas
                        _selectedDay = DateTime.now();
                        _focusedDay = DateTime.now();
                      });
                    },
                    icon: const Icon(
                      Icons.check_box_outline_blank_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
              child: TableCalendar(
                locale: 'pt_BR', //Traduzindo os meses
                focusedDay: _focusedDay,
                firstDay: kFirstDay,
                lastDay: kLastDay,
                calendarFormat: format,

                startingDayOfWeek: StartingDayOfWeek
                    .monday, //Indica que o primeiro dia do calendário é segunda
                pageJumpingEnabled:
                    true, //permite clicar em um dia fora do mês, que ele irá direcionar para o outro mês

                //informa os eventos
                eventLoader: _getEventsForDay,

                //Seleciono um novo dia
                onDaySelected: (newSelectedDay, newFocusedDay) {
                  setState(() {
                    //aq posso unir as duas
                    _selectedDay = newSelectedDay;
                    _focusedDay = newFocusedDay;
                  });
                },

                //Altera o formato do calendário mensal, semanal, duas semanas
                // ignore: no_leading_underscores_for_local_identifiers
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },

                //FALTA
                //Função que permite se determinado dia deve ser marcado como selecionado.
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),

                //TERMINA

                //Alterando nomes padrão de month, week e twoWeeks
                availableCalendarFormats: const {
                  CalendarFormat.month: 'mês',
                  CalendarFormat.week: 'semana',
                  CalendarFormat.twoWeeks: '2 semanas'
                },

                //Brincando com os estilos do table calendar
                headerStyle: HeaderStyle(
                  //Ajusta setinhas
                  leftChevronIcon: const Icon(
                    Icons.chevron_left_outlined,
                    size: 24,
                    color: Colors.black54,
                  ),
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronIcon: const Icon(
                    Icons.chevron_right_outlined,
                    size: 24,
                    color: Colors.black54,
                  ),
                  rightChevronMargin: EdgeInsets.zero,
                  //Elimina o padding do header
                  headerPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  //caso queira remover o botão de trocar os estilos de calendário
                  formatButtonVisible: true,
                  //indica se o botão de trocar os estilos mostra o tipo selecionado ou mostra o tipo que irá ser alterado ao clicar no botão
                  formatButtonShowsNext: true,
                  //personalizar os botões para trocar os estilos
                  formatButtonDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15)),
                  //personalizar o texto dos botões para trocar os estilos
                  formatButtonTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 12),
                  // altera a fonte do nome do mês e centraliza
                  titleTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  titleCentered: false,
                ),

                //Aplicando estilo no calendário
                calendarStyle: CalendarStyle(
                  outsideDaysVisible:
                      false, //Oculta os dias posteriores ao último dia do mês.
                  //Cor do dia selecionado
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  //Style do texto selecionado
                  selectedTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  //Cor do dia de hoje
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  //Texto do dia de hoje
                  todayTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.primary),

                  //Cor da box dos dias de semana
                  defaultDecoration: const BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  //texto dos dias de semana
                  defaultTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  //Cor da box dos fins de semana
                  weekendDecoration: const BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  //texto dos dias de semana
                  weekendTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),

                calendarBuilders: CalendarBuilders(
                  //Trazindo a cor dos nomes do dia no header
                  dowBuilder: (context, day) {
                    String text;
                    if (day.weekday == DateTime.sunday) {
                      text = 'D';
                    } else if (day.weekday == DateTime.monday) {
                      text = 'S';
                    } else if (day.weekday == DateTime.tuesday) {
                      text = 'T';
                    } else if (day.weekday == DateTime.wednesday) {
                      text = 'Q';
                    } else if (day.weekday == DateTime.thursday) {
                      text = 'Q';
                    } else if (day.weekday == DateTime.friday) {
                      text = 'S';
                    } else if (day.weekday == DateTime.saturday) {
                      text = 'S';
                    } else {
                      text = 'err';
                    }
                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    );
                  },

                  //Cor dos marcadores para os eventos..
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            bottom: 2.0,
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      // return Positioned(
                      //   bottom: 2.0,
                      //   child: Container(
                      //     height: 10.0,
                      //     width: 10.0,
                      //     decoration: const BoxDecoration(
                      //       color: Colors.red,
                      //       shape: BoxShape.rectangle,
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(15.0)),
                      //     ),
                      //   ),
                      // );
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("dd 'de' MMMM").format(_selectedDay),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  ..._getEventsForDay(_selectedDay).map(
                    (event) => ListTile(
                      leading: const Icon(Icons.airplane_ticket_rounded),
                      title: Text(
                        event.title.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        event.description.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
