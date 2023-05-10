import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../clases sensores/colecciones.dart';
import '../clases sensores/sensores.dart';

class ItemsPa extends StatefulWidget {
  const ItemsPa({super.key});

  @override
  State<ItemsPa> createState() => _ItemsPaState();
}

class _ItemsPaState extends State<ItemsPa> {
  TextEditingController _controller = TextEditingController();
  bool _idValido = false;

  void _validarID() async {
  final id = _controller.text;

  try {
    final doc = await FirebaseFirestore.instance
        .collection('id')
        .doc(id)
        .get();

    if (!doc.exists) {
      throw Exception('ID inválido');
    }

    setState(() {
      _idValido = true;
    });
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}

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

  /*@override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sensores",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Soluciones inteligentes",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/plantlink.png",
                      height: height * 0.09,
                    )
                  ],
                ),
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
                                    color: Colors.white,
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
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('CO2'),
                                      trailing: Text(
                                        coleccionData.co2.valor.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.cloud),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Gas'),
                                      trailing: Text(
                                        coleccionData.gas.valor.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.ac_unit),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Humedad'),
                                      trailing: Text(
                                        coleccionData.humedad.valor.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.wb_sunny),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Humedad del Suelo'),
                                      trailing: Text(
                                        coleccionData.humedadDelSuelo.valor
                                            .toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.grass),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Intensidad de Luz'),
                                      trailing: Text(
                                        coleccionData.intensidadLuz.valor
                                            .toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.lightbulb),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Smoke'),
                                      trailing: Text(
                                        coleccionData.smoke.valor.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.smoke_free),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 420,
                                  child: Card(
                                    child: ListTile(
                                      title: const Text('Temperatura'),
                                      trailing: Text(
                                        coleccionData.temperatura.valor
                                            .toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const Icon(Icons.thermostat),
                                    ),
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
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sensores",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Soluciones inteligentes",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/plantlink.png",
                      height: height * 0.09,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _idValido
                  ? cargando
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
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title: const Text('CO2'),
                                          trailing: Text(
                                            coleccionData.co2.valor.toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(Icons.cloud),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title: const Text('Gas'),
                                          trailing: Text(
                                            coleccionData.gas.valor.toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(
                                              Icons.local_gas_station),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title: const Text('Humedad'),
                                          trailing: Text(
                                            coleccionData.humedad.valor
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading:
                                              const Icon(Icons.invert_colors),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title:
                                              const Text('Humedad del Suelo'),
                                          trailing: Text(
                                            coleccionData.humedadDelSuelo.valor
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(Icons.grass),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title:
                                              const Text('Intensidad de Luz'),
                                          trailing: Text(
                                            coleccionData.intensidadLuz.valor
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(Icons.lightbulb),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title: const Text('Smoke'),
                                          trailing: Text(
                                            coleccionData.smoke.valor
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(Icons.smoke_free),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      width: 420,
                                      child: Card(
                                        child: ListTile(
                                          title: const Text('Temperatura'),
                                          trailing: Text(
                                            coleccionData.temperatura.valor
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          leading: const Icon(Icons.thermostat),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.08, vertical: height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Ingrese el ID del dispositivo",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.02),
                          SizedBox(
                            height: 60,
                            width: width * 0.8,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          SizedBox(
                            width: width * 0.8,
                            child: ElevatedButton(
                              onPressed: _validarID,
                              child: const Text("Continuar"),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
