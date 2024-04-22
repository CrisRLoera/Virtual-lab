import 'package:flutter/material.dart';

class CalcPorosidadAp extends StatefulWidget {
  const CalcPorosidadAp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcPorosidadApState createState() => _CalcPorosidadApState();
}

class _CalcPorosidadApState extends State<CalcPorosidadAp> {
  final _controllerWw = TextEditingController();
  final TextEditingController _controllerWd = TextEditingController();
  final TextEditingController _controllerWs = TextEditingController();

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
                  'Porosidad Aparente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Peso mojado',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerWw,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Peso seco',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerWd,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Peso suspendido',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerWs,
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
                          '$_result %',
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
      double wW = double.tryParse(_controllerWw.text) ?? 0;
      double wD = double.tryParse(_controllerWd.text) ?? 0;
      double wS = double.tryParse(_controllerWs.text) ?? 1;
      double result = ((wW - wD) / (wW - wS)) * 100;
      String porcent = result.toStringAsFixed(3);
      _result = porcent;
    });
  }
}
