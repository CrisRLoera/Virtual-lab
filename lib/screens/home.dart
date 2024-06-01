import 'package:flutter/material.dart';
import 'package:laboratorio_virtual/screens/materiales.dart';
import 'package:laboratorio_virtual/screens/quimica.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.account_circle,
                  size: 40,
                )),
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Table(
              children: const [
                TableRow(children: [
                  Signature(
                      Icon(
                        Icons.science,
                        size: 100,
                      ),
                      Colors.green,
                      'Química',
                      QuimicaScreen()),
                  Signature(
                      Icon(
                        Icons.grid_on,
                        size: 100,
                      ),
                      Colors.orange,
                      'Materiales',
                      MaterialesScreen()),
                ]),
                TableRow(children: [
                  Signature(
                      Icon(
                        Icons.thermostat,
                        size: 100,
                      ),
                      Colors.red,
                      'Termodinámica',
                      MaterialesScreen()),
                  Signature(
                      Icon(
                        Icons.table_chart,
                        size: 100,
                      ),
                      Colors.lightBlue,
                      'Estructuras',
                      MaterialesScreen())
                ])
              ],
            )),
            const SizedBox(
              height: 100,
            )
          ]),
    );
  }
}

class Signature extends StatelessWidget {
  final Icon iconName;
  final Color color;
  final String signatureName;
  final Widget routePage;

  const Signature(this.iconName, this.color, this.signatureName, this.routePage,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: color)),
              child: IconButton(
                icon: iconName,
                color: color,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => routePage));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              signatureName,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}
