import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../clases sensores/colecciones.dart';
import '../clases sensores/sensores.dart';

class PantallaDatos extends StatefulWidget {
  const PantallaDatos({super.key});

  @override
  _PantallaDatosState createState() => _PantallaDatosState();
}

class _PantallaDatosState extends State<PantallaDatos> {
  late DatabaseReference coleccionRef;
  late ColeccionData coleccionData;
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    coleccionRef =
        FirebaseDatabase.instance.ref().child('Centinel01').child('Sensores');
    coleccionRef.onValue.listen((event) {
      setState(() {
        coleccionData = ColeccionData(
          event.snapshot.child('Tiempo').child('Valor').value as String,
          SensorData(event.snapshot.child('CO2').child('Valor').value as int),
          SensorData(event.snapshot.child('Gas').child('Valor').value as int),
          SensorData(
              event.snapshot.child('Humedad').child('Valor').value as int),
          SensorData(event.snapshot
              .child('HumedadDelSuelo')
              .child('Valor')
              .value as int),
          SensorData(event.snapshot.child('IntensidadLuz').child('Valor').value
              as int),
          SensorData(event.snapshot.child('Smoke').child('Valor').value as int),
          SensorData(
              event.snapshot.child('Temperatura').child('Valor').value as int),
        );
        cargando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PlantLink',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Soluciones inteligentes',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              width: 50,
              height: 50,
              child: Image(
                image: AssetImage('assets/plantlink.png'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        cargando
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'Tiempo',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/tiempo.json',
                              width: 150,
                              height: 150,
                            ),
                          ],
                        ),
                        Text(
                          '${coleccionData.tiempo}',
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: ListTile(
                            title: const Text('CO2'),
                            trailing: Text(
                              coleccionData.co2.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.cloud),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text('Gas'),
                            trailing: Text(
                              coleccionData.gas.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.ac_unit),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text('Humedad'),
                            trailing: Text(
                              coleccionData.humedad.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.wb_sunny),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text('Humedad del Suelo'),
                            trailing: Text(
                              coleccionData.humedadDelSuelo.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.grass),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text('Intensidad de Luz'),
                            trailing: Text(
                              coleccionData.intensidadLuz.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.lightbulb),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text('Smoke'),
                            trailing: Text(
                              coleccionData.smoke.valor.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            leading: const Icon(Icons.smoke_free),
                          ),
                        ),
                        Card(
                          child:

ListTile(
title: const Text('Temperatura'),
trailing: Text(
coleccionData.temperatura.valor.toString(),
style: const TextStyle(fontSize: 18),
),
leading: const Icon(Icons.thermostat),
),
),
],
),
),
],
),
),
],
),
);
  }
}