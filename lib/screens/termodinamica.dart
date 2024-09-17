import 'package:flutter/material.dart';
import 'package:laboratorio_virtual/termodinamica/ter_cal_gas_ideal.dart';
import 'package:laboratorio_virtual/termodinamica/ter_cal_tranf_cal.dart';
import 'package:laboratorio_virtual/termodinamica/ter_cal_cost_energ.dart';

class TermodinamicaScreen extends StatefulWidget {
  const TermodinamicaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermodinamicaScreenState createState() => _TermodinamicaScreenState();
}

class _TermodinamicaScreenState extends State<TermodinamicaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Table(
            children: const [
              TableRow(children: [
                OptionIconButton(Icon(Icons.calculate), Colors.black,
                    'Costo de energía utilizada', CalcCostEnergia()),
                OptionIconButton(Icon(Icons.calculate), Colors.black,
                    'Transferencia de calor', CalcTransCal())
              ]),
              TableRow(children: [
                OptionIconButton(Icon(Icons.calculate), Colors.black,
                    'Gas Ideal', CalcGasIdeal()),
                SizedBox(
                  height: 20,
                )
              ])
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
            const Center(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              optionName,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
