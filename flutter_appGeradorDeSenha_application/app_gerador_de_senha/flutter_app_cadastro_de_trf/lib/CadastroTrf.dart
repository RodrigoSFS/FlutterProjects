import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'listToTrf.dart';

class cadastroTrf extends StatefulWidget {
  @override
  _cadastroTrfState createState() => _cadastroTrfState();
}

class _cadastroTrfState extends State<cadastroTrf> {
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Trf'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(children: [
            sizedBox(),
            descricaoTRF(),
            sizedBox(),
            dataTRF(),
            sizedBox(),
            horaTRF(),
            fieldCalendario(),
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          addListTask(_descricaoController.text, _dataController.text,
              _horaController.text);
        },
      ),
    );
  }

  Widget sizedBox() {
    return SizedBox(
      height: 30,
    );
  }

  Widget descricaoTRF() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: _descricaoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Qual sua TRF',
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget dataTRF() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: _dataController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Para qual dia é a TRF',
          icon: Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100));
          if (pickedDate != null) {
            String dataFormatada = DateFormat('dd/MM/yyyy').format(pickedDate);
            setState(() {
              _dataController.text = dataFormatada;
            });
          }
        },
      ),
    );
  }

  Widget horaTRF() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: TextField(
          controller: _horaController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Para que horas é a TRF',
            icon: Icon(Icons.timer),
          ),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());
            if (pickedTime != null) {
              setState(() {
                _horaController.text = pickedTime.format(context);
              });
            }
          }),
    );
  }

  Widget fieldCalendario() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.black87, width: 2.0),
      ),
      child: TableCalendar(
        firstDay: DateTime.now(),
        lastDay: DateTime(2100),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
      ),
    );
  }
}

void addListTask(String descricao, String data, String hora) {
  Task t = Task(descricao, data, hora);
  listTask.add(t);
}
