import 'package:flutter/material.dart';
import 'package:laboratorio_virtual/components/calculadora_component.dart';

class MaterialesScreen extends StatefulWidget {
  const MaterialesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MaterialesScreenState createState() => _MaterialesScreenState();
}

class _MaterialesScreenState extends State<MaterialesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Table(
            children: const [
              TableRow(
                children: [
                  OptionIconButton(Icon(Icons.calculate), Colors.black,
                      'Calculadora', CaluladoraComponent())
                ],
              )
            ],
          ),
        ));
  }
}

class OptionIconButton extends StatelessWidget {
  final Icon iconName;
  final Color color;
  final String optionName;
  final Widget routePage;

  const OptionIconButton(
      this.iconName, this.color, this.optionName, this.routePage,
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
              optionName,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}
