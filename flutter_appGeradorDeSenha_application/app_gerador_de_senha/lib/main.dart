import 'dart:math';

import 'package:flutter/material.dart';

// primeiro cria o main
void main() {
  runApp(GeradorSenhaApp());
}

bool maiuscula = true;
bool minusculo = true;
bool caracterEspecial = true;
bool numeros = true;
double range = 6;
String pass = "";

String geradorPassWord(){
  List<String> charList = <String>[
    maiuscula ? "ABCDEFGHIJKLMNOPQRSTUVWXYZ" : "",
    minusculo ? "abcdefghijklmnopqrstuvwxyz" : "",
    caracterEspecial? "!@#%^&*()_+<>;:,./?" : "",
    numeros ? "0123456789" : "",
  ];

  final String chars = charList.join('');
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(range.round(), (_) => chars.codeUnitAt(rnd.nextInt(chars.length))
  ));
}

class GeradorSenhaAppState extends State<GeradorSenhaApp> {

  void geradorPasswordState(){
  setState(() {
    pass = geradorPassWord();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Gerador de Senha'),
          ),
          body: Center(
            child: Column(
              children: [
                sizeBox(),
                sizeBoxIMG(),
                textoMaior(),
                sizeBox(),
                textoMenor(),
                sizeBox(),
                opcoes(),
                sizeBox(),
                slider(),
                sizeBox(),
                botao(),
                sizeBox(),
                resultado(),
                sizeBox(),
              ],
            ),
          )),
    );
  }

  Widget resultado() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width*.70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child:
        Text(
          pass,
          style: TextStyle(
            fontSize: 20, color: Colors.black,
          ),
        )
      ),
    );
  }

  Widget botao(){
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: Text("Gerar Senha"),
        onPressed: geradorPasswordState,
      ),
    );
  }

  Widget slider(){
    return Slider(
      value:range,
      max: 50,
      divisions: 50,
      label: range.round.toString(),
      onChanged: (double newRange) {
        setState(() {
          range = newRange;
        });
      },
    );
  }

  Widget sizeBox() {
    return SizedBox(
      height: 20,
    );
  }

  Widget sizeBoxIMG() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.network(
          "https://cdn.pixabay.com/photo/2013/04/01/09/02/read-only-98443_1280.png"),
    );
  }

  Widget textoMaior() {
    return Text(
      "Gerador automático de senhas",
      style: TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    );
  }

  Widget textoMenor() {
    return Text(
      "Aqui você escolhe como deseja gerar sua senha",
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  Widget opcoes() {
    return Row(
      children: [
        Checkbox(
            value: maiuscula,
            onChanged: (bool? value) {
              setState(() {
                maiuscula = value!;
              });
            }),
        Text("[A-Z]"),
        Checkbox(
            value: minusculo,
            onChanged: (bool? value) {
              setState(() {
                minusculo = value!;
              });
            }),
        Text("[a-z]"),
        Checkbox(
            value: numeros,
            onChanged: (bool? value) {
              setState(() {
                numeros = value!;
              });
            }),
        Text("[0-9]"),
        Checkbox(
            value: caracterEspecial,
            onChanged: (bool? value) {
              setState(() {
                caracterEspecial = value!;
              });
            }),
        Text("[@-%]"),
      ],
    );
  }


}

class GeradorSenhaApp extends StatefulWidget {
  GeradorSenhaAppState createState() {
    return GeradorSenhaAppState();
  }
}
