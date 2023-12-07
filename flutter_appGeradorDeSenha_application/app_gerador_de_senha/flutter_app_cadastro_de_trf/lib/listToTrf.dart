import 'package:flutter/material.dart';

List<Task> listTask = [];

class listToTrf extends StatefulWidget {
  @override
  _listToTrfState createState() => _listToTrfState();
}

class _listToTrfState extends State<listToTrf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua lista de tarefas'),
      ),
      body: ListView.builder(
          itemCount: listTask.length,
          itemBuilder: (BuildContext context, int index) {
            String desc = listTask[index].descricao;
            String data = listTask[index].data;
            String hora = listTask[index].hora;
            return Dismissible(key: UniqueKey(), 
            background: Container(color: Colors.red),
            onDismissed: (direction){
              listTask.removeAt(index);
            },
            child: ListTile(
              //leading: Icon(Icons.list),
              leading: CircleAvatar(child: Text(index.toString()),),
              title: Text('TRF $desc'),
              subtitle: Text('Data $data'+' - '+'Hora $hora'),
            ));
          }),
    );
  }
}

class Task {
  String descricao;
  String data;
  String hora;
  Task(this.descricao, this.data, this.hora);
}
