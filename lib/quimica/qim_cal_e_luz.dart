import 'dart:math';

import 'package:flutter/material.dart';

class CalcELuz extends StatefulWidget {
  const CalcELuz({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcELuzState createState() => _CalcELuzState();
}

class _CalcELuzState extends State<CalcELuz> {
  final _controllerL = TextEditingController();
  final _controllerLe = TextEditingController();

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
          width: 300,
          height: 400,
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
                  'Energia de la luz',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Longitud de onda',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerL,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Exponente de la longitud de onda',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerLe,
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
                          '$_result J/fotón',
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
      double L = double.tryParse(_controllerL.text) ?? 0;
      double Le = double.tryParse(_controllerLe.text) ?? 0;
      double result =
          ((6.63 * pow(10, -34)) * (3 * pow(10, 8))) / (L * (pow(10, Le)));
      String porcent = _formatScientificNotation(result, 3);
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
