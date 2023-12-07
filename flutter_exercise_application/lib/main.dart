import "dart:math";

import "package:flutter/material.dart";

// se não colocar void ele também funciona
// A Material design é a biblioteca provida pela google que nos dá o necessário para rodar a aplicação
main() {
  runApp(QuizApp());
}

class QuizAppState extends State<QuizApp> {
  int pontos = 0;
  int question = 0;
  var listaSorteio = [0,0,0];
  int nrSorteado = -1;

  void sorteio(){
    listaSorteio[0] = Random().nextInt(3);
    nrSorteado = Random().nextInt(3);
    while (nrSorteado == listaSorteio[0]){
      nrSorteado = Random().nextInt(3);
    }

    listaSorteio[1] = nrSorteado;

    nrSorteado = Random().nextInt(3);

    while (nrSorteado == listaSorteio[0] || nrSorteado == listaSorteio[1]){
      nrSorteado = Random().nextInt(3);
    }

    listaSorteio[2] = nrSorteado;

    print(listaSorteio);
  }

  void wrong_answare() {
    pontos = pontos + -1;
    print('Resposta errada!' + pontos.toString());
  }

  void answare() {
    setState(() {
      question++;
      pontos = pontos + 1;
      sorteio();
      print(pontos);
    });
  }

  final List<String> questions = [
    "Qual é a capital do Brasil?",
    "Qual é a cor do cavalo branco de napoleão?",
    "O que tem dentro do ovo?"
  ];

  final List<String> answares0 = ["Brasiliam", "Brasília", "Acre"];

  final List<String> answares1 = ["Branco", "Preto", "Cinza"];

  final List<String> answares2 = ["Gema", "Rinoceronte", "A letra v"];

  @override
  Widget build(BuildContext context) {
      sorteio();  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        drawer: Drawer(),
        body: Center(
          child: Column(children: [
            Text(questions[question]), SizedBox( height: 20,),
            ElevatedButton(onPressed: answare, child: Text(question == 0? answares0[0]: question == 1? answares1[0]: answares2[0])),
            ElevatedButton(onPressed: answare, child: Text(question == 0? answares0[1]: question == 1? answares1[1]: answares2[1])),
            ElevatedButton(onPressed: answare, child: Text(question == 0? answares0[2]: question == 1? answares1[2]: answares2[2])),
          ]),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  QuizAppState createState() {
    return QuizAppState();
  }
}
