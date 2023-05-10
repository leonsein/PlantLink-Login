import 'package:flutter/material.dart';

class ExpoL extends StatefulWidget {
  const ExpoL({super.key});

  @override
  State<ExpoL> createState() => _ExpoLState();
}

class _ExpoLState extends State<ExpoL> {
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
                          image: AssetImage("assets/expoluz.jpg"),
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
                  "Exposición a la luz", 
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
                    "Las plantas necesitan luz para crecer, pero es importante controlar la cantidad y la calidad de la luz a la que están expuestas. Algunas plantas necesitan luz solar directa, mientras que otras prefieren la sombra. Los rayos del luz son captados por las plantas a través de receptores que se encargan de “traducir” estos rayos en energía para la realización de funciones vitales para el organismo. Esta reacción se conoce como fototropismo. Cuando una planta crece hacia la fuente de una fuente lumínica se conoce como fototropismo positivo y es el que realizan los tallos de las plantas. Sin embargo, si este crecimiento se realiza en dirección opuesta a la de la luz, se trata de fototropismo negativo. Este último es propio de las raíces que suelen crecer alejándose de la luz.", 
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