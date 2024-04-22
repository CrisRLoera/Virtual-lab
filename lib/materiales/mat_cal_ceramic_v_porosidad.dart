import 'package:flutter/material.dart';

class CalcPorosidadVe extends StatefulWidget {
  const CalcPorosidadVe({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalcPorosidadVeState createState() => _CalcPorosidadVeState();
}

class _CalcPorosidadVeState extends State<CalcPorosidadVe> {
  final _controllerp = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();

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
                  'Porosidad Verdadera',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Densidad verdadera',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerp,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Densidad volumétrica',
                      fillColor: Color.fromARGB(255, 229, 247, 255),
                      filled: true),
                  controller: _controllerB,
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
      double p = double.tryParse(_controllerp.text) ?? 0;
      double B = double.tryParse(_controllerB.text) ?? 0;

      double result = ((p - B) / (p)) * 100;
      String porcent = result.toStringAsFixed(3);
      _result = porcent;
    });
  }
}
