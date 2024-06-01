import 'dart:math';

import 'package:flutter/material.dart';

class CalcEcGasIdeal extends StatefulWidget {
  const CalcEcGasIdeal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcEcGasIdealState createState() => _CalcEcGasIdealState();
}

class _CalcEcGasIdealState extends State<CalcEcGasIdeal> {
  final _controllerP = TextEditingController();
  final _controllerV = TextEditingController();
  final _controllerT = TextEditingController();

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 188, 234, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.calculate),
                const Text(
                  'Ecuación de los gases ideales',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Presión en atm',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerP,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Volumen en L',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerV,
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Temperatura absoluta',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerT,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _calculateResult,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
                        child: Text(
                          'Resultado:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '$_result mol',
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  void _calculateResult() {
    setState(() {
      double P = double.tryParse(_controllerP.text) ?? 0;
      double V = double.tryParse(_controllerV.text) ?? 0;
      double T = double.tryParse(_controllerT.text) ?? 0;
      double result = (P * V) / (0.082 * T);
      String porcent = '';
      if ((_getExponent(result)).abs() < 3) {
        porcent = _formatScientificNotation(result, 3);
      } else {
        porcent = result.toStringAsPrecision(3);
      }
      _result = porcent;
    });
  }
}

String _formatScientificNotation(double value, int precision) {
  if (value == 0) return "0";

  int exponent = (value == 0) ? 0 : (log(value.abs()) / ln10).floor();
  double mantissa = value / pow(10, exponent);

  // Redondear la mantisa al número deseado de decimales
  String mantissaStr = mantissa.toStringAsFixed(precision);

  // Convertir el exponente a superíndices
  String exponentStr = _convertToSuperscript(exponent);

  return '$mantissaStr x 10$exponentStr';
}

int _getExponent(double value) {
  return (value == 0) ? 0 : (log(value.abs()) / ln10).floor();
}

String _convertToSuperscript(int number) {
  const superScriptDigits = '⁰¹²³⁴⁵⁶⁷⁸⁹';
  const superScriptMinus = '⁻';

  String numberStr = number.abs().toString();
  String superScriptStr = number < 0 ? superScriptMinus : '';

  for (int i = 0; i < numberStr.length; i++) {
    superScriptStr += superScriptDigits[int.parse(numberStr[i])];
  }

  return superScriptStr;
}
