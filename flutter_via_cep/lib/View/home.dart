import 'package:flutter/material.dart';
import 'package:flutter_via_cep/Controller/consulta_cep_controller.dart';
import 'package:flutter_via_cep/Model/endereco_model.dart';

// sft
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textCep = TextEditingController();
  cepController _cepController = cepController();
  late Future<Endereco> _future = _cepController.consultaCep('85950000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('appConsultaCep')),
        backgroundColor: Colors.amber,
      ),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(40)),
        TextField(
          controller: _textCep,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
          onPressed: () {
            setState(() {
              _future = _cepController.consultaCep(_textCep.text);
            });
          },
          child: Text('Consultar'),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                        child: Text(
                            snapshot.data!.localidade +
                                '-' +
                                snapshot.data!.logradouro +
                                '-' +
                                snapshot.data!.bairro +
                                '-' +
                                snapshot.data!.complemento +
                                '-' +
                                snapshot.data!.uf,
                            style: TextStyle(fontSize: 15)));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
      ]),
    );
  }
}
