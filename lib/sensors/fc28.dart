import 'package:flutter/material.dart';

class FC28 extends StatefulWidget {
  const FC28({super.key});

  @override
  State<FC28> createState() => _FC28State();
}

class _FC28State extends State<FC28> {
  @override
  Widget build(BuildContext context) {
  
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.23,
                      width: width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/fc28.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.24, 
                      width: width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, 
                        vertical: height * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded, 
                              size: 40,
                            ),
                          ),
                          const Icon(
                            Icons.favorite_border, 
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02,),
                const Text(
                  "FC-28", 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 25, 
                    letterSpacing: 10),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                  ),
                  child: const Text(
                    "El Sensor de humedad de Suelo FC-28 permite medir de forma sencilla la humedad del suelo por medio de 2 electrodos resistivos. Compatible con Arduino, PIC, ESP8266/NodeMCU/NodeMCU-32. El sensor es ideal para monitorear el nivel de humedad de tus plantas y así recordar cuando necesitan ser regadas o incluso para realizar un sistema totalmente automatizado de riego añadiendo una válvula o una bomba de agua. El funcionamiento del sensor se basa en medir la resistencia entre 2 electrodos insertados dentro del suelo, la resistencia entre los electrodos dependerá de la humedad del suelo, por lo que para un suelo muy húmedo tendremos una resistencia muy baja (corto circuito) y para un suelo muy seco la resistencia será muy alta (circuito abierto).", 
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),      
        ),
      ),
    );
  }
}