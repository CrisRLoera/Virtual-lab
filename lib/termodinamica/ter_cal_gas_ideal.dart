import 'package:flutter/material.dart';

class CalcGasIdeal extends StatefulWidget {
  const CalcGasIdeal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcGasIdealState createState() => _CalcGasIdealState();
}

class _CalcGasIdealState extends State<CalcGasIdeal> {
  final _controllerR = TextEditingController();
  final TextEditingController _controllerV = TextEditingController();
  final TextEditingController _controllerT = TextEditingController();

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
                  'Gas Ideal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Constante del gas',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerR,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Volumen del gas',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerV,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
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
                          '$_result',
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
      double? R = double.tryParse(_controllerR.text);
      double V = double.tryParse(_controllerV.text) ?? 0;
      double? T = double.tryParse(_controllerT.text);
      double result = (R! * (T! / V));
      _result = result.toStringAsFixed(3);
    });
  }
}
