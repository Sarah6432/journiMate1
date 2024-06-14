import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'modelo_calendario.dart';

class TelaCalendario extends StatefulWidget {
  @override
  _TelaCalendarioState createState() => _TelaCalendarioState();
}

class _TelaCalendarioState extends State<TelaCalendario> {
  DateTime _diaSelecionado = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Calendário',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper-diario1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Consumer<ModeloCalendario>(
                  builder: (context, modelo, _) {
                    return CalendarioWidget(
                      diaSelecionado: _diaSelecionado,
                      onDaySelected: (selectedDay) {
                        setState(() {
                          _diaSelecionado = selectedDay;
                        });
                      },
                      eventos: modelo.eventos,
                    );
                  },
                ),
                ListaEventosWidget(diaSelecionado: _diaSelecionado),
                TodosEventosWidget(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogoAdicionarEvento(context),
        child: Icon(Icons.add, color: Colors.pink),
        backgroundColor: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  void _dialogoAdicionarEvento(BuildContext context) {
    final _controladorEvento = TextEditingController();
    DateTime _dataSelecionada = _diaSelecionado;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Evento'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controladorEvento,
              decoration: InputDecoration(hintText: 'Descrição do Evento'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _dataSelecionada,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != _dataSelecionada) {
                  setState(() {
                    _dataSelecionada = picked;
                  });
                }
              },
              child: Text('Selecionar Data'),
            ),
            Text(
              'Data selecionada: ${_dataSelecionada.day}/${_dataSelecionada.month}/${_dataSelecionada.year}',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_controladorEvento.text.isNotEmpty) {
                Provider.of<ModeloCalendario>(context, listen: false)
                    .adicionarEvento(_dataSelecionada, _controladorEvento.text);
                Navigator.of(context).pop();
              }
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}

class CalendarioWidget extends StatelessWidget {
  final Function(DateTime) onDaySelected;
  final DateTime diaSelecionado;
  final Map<DateTime, List<String>> eventos;

  CalendarioWidget({
    required this.onDaySelected,
    required this.diaSelecionado,
    required this.eventos,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: diaSelecionado,
      selectedDayPredicate: (day) => isSameDay(day, diaSelecionado),
      onDaySelected: (selectedDay, focusedDay) {
        onDaySelected(selectedDay);
      },
      eventLoader: (dia) {
        return eventos[dia] ?? [];
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.pinkAccent,
          shape: BoxShape.circle,
        ),
        markersMaxCount: 1,
        markerDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.pink),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.5),
            ),
            margin: const EdgeInsets.all(6.0),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}

class ListaEventosWidget extends StatelessWidget {
  final DateTime diaSelecionado;

  ListaEventosWidget({required this.diaSelecionado});
  @override
  Widget build(BuildContext context) {
    final eventos =
        Provider.of<ModeloCalendario>(context).obterEventos(diaSelecionado);
    return eventos.isEmpty
        ? Center()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(eventos[index]),
                ),
              );
            },
          );
  }
}

class TodosEventosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventos = Provider.of<ModeloCalendario>(context).obterTodosEventos();
    List<Widget> eventosWidgets = [];

    eventos.forEach((data, eventos) {
      eventos.forEach((evento) {
        eventosWidgets.add(
          Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              title: Text(
                '${data.day}/${data.month}/${data.year}: $evento',
                style: TextStyle(fontSize: 16),
              ),
              tileColor: Colors.lightBlue.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        );
      });
    });

    return Expanded(
      child: eventosWidgets.isEmpty
          ? Center(
              child: Text(
                'Nenhum evento adicionado.',
              ),
            )
          : ListView(
              children: eventosWidgets,
            ),
    );
  }
}