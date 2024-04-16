import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
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
                  Signature(Icons.science, Colors.green, 'Química'),
                  Signature(Icons.grid_on, Colors.orange, 'Estructuras')
                ]),
                TableRow(children: [
                  Signature(Icons.thermostat, Colors.red, 'Termodinámica'),
                  Signature(Icons.table_chart, Colors.lightBlue, 'Estructuras')
                ])
              ],
            )),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ir atrás'),
              ),
            )
          ]),
    );
  }
}

class Signature extends StatelessWidget {
  final IconData iconName;
  final Color color;
  final String signatureName;

  const Signature(this.iconName, this.color, this.signatureName, {super.key});

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
              child: Icon(
                iconName,
                color: color,
                size: 100,
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
