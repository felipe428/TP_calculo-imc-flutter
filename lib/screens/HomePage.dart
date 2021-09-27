import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculadoraimc/screens/Sobre.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String _resultado = ' ';
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                subtitle: Text("Calcule seu IMC"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.app_settings_alt_sharp),
                title: Text("Sobre"),
                subtitle: Text("Informações da aplicação"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sobre()),
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: Text(
                'Insira as informações',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            editTexto('Peso (Kg)', _controllerPeso),
            editTexto('Altura (Cm)', _controllerAltura),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
                height: 50.0,
                width: 250.0,
                color: Colors.blue,
                child: ElevatedButton(
                  onPressed: () {
                    double? peso = double.tryParse(_controllerPeso.text);
                    double? altura = double.tryParse(_controllerAltura.text);

                    if (peso != null && altura != null) {
                      altura = altura / 100.0;
                      double _imc = (peso / (altura * altura)).roundToDouble();
                      setState(() {
                        if (_imc < 17) {
                          _resultado = 'IMC: $_imc - Muito abaixo do peso.';
                        } else if (_imc >= 17 && _imc <= 18.4) {
                          _resultado = 'IMC: $_imc - Abaixo do peso.';
                        } else if (_imc >= 18.5 && _imc <= 24.9) {
                          _resultado = 'IMC: $_imc - Peso normal.';
                        } else if (_imc >= 25 && _imc <= 29.9) {
                          _resultado = 'IMC: $_imc - Acima do peso.';
                        } else if (_imc >= 30 && _imc <= 34.9) {
                          _resultado = 'IMC: $_imc - Obesidade grau I.';
                        } else if (_imc >= 35 && _imc <= 40) {
                          _resultado = 'IMC: $_imc - Obesidade grau II.';
                        } else if (_imc > 40) {
                          _resultado =
                              'IMC: $_imc - Obesidade grau III (mórbida).';
                        }
                      });
                    } else {
                      setState(() {
                        _resultado = 'Campos não preenchidos.';
                      });
                    }
                  },
                  child: Text('Calcular'),
                ))
          ]),
        ));
  }

  Padding editTexto(String texto, TextEditingController _controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
          labelStyle: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
    );
  }
}
