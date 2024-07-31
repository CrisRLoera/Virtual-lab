import 'package:flutter/material.dart';

class CalcDesplEqyCom extends StatefulWidget {
  const CalcDesplEqyCom({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcDesplEqyComState createState() => _CalcDesplEqyComState();
}

class _CalcDesplEqyComState extends State<CalcDesplEqyCom> {
  final _controllerFx = TextEditingController();
  final TextEditingController _controllerF2 = TextEditingController();
  final TextEditingController _controllerk = TextEditingController();

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
                  'Desplazamiento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Fuerza excéntrica',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerFx,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Fuerza 2',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerF2,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Constante de rigidez',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerk,
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
      double P = double.tryParse(_controllerFx.text) ?? 0;
      double F2 = double.tryParse(_controllerF2.text) ?? 0;
      double k = double.tryParse(_controllerk.text) ?? 1;
      double result = ((P / (4 * k)) - (F2 / (2 * k)));
      _result = result.toStringAsFixed(3);
    });
  }
}
