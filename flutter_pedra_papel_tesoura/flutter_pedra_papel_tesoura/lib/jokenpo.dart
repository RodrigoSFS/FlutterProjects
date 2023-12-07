import 'dart:math';

import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagemApp = '';
  var _userWin = 0;
  var _appWin = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = AssetImage('images/pedra.png');
        });
      case 'papel':
        setState(() {
          _imagemApp = AssetImage('images/papel.png');
        });
      case 'tesoura':
        setState(() {
          _imagemApp = AssetImage('images/tesoura.png');
        });
    }
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      setState(() {
        _mensagemApp = 'Vocë ganhou :)';
        _userWin += 1;
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel')) {
      setState(() {
        _mensagemApp = 'App ganhou :)';
        _appWin += 1;
      });
    } else {
      setState(() {
        _mensagemApp = 'Empate :)';
        _empate += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              '1,2,3...Já',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              _mensagemApp,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('pedra');
                },
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('papel');
                },
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('tesoura');
                },
                child: Image.asset('images/tesoura.png', height: 100),
              )
            ],
          ),
          Column(
            children: [
              Text(
                'Você:$_userWin',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'App:$_appWin',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Empate:$_empate',
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
