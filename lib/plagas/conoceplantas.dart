import 'package:flutter/material.dart';

class CPlantas extends StatefulWidget {
  const CPlantas({super.key});

  @override
  State<CPlantas> createState() => _CPlantasState();
}

class _CPlantasState extends State<CPlantas> {
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
                          image: AssetImage("assets/conoceplantas.jpg"),
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
                  "Conoce tus plantas", 
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
                    "Cada planta es única y tiene sus propias necesidades. Investiga sobre las condiciones de luz, temperatura, humedad y riego adecuadas para el tipo de planta que tienes y adapta el cuidado en consecuencia. La plantas nos proporcionan alimentos, medicinas, madera, combustible y fibras. Además, brindan cobijo a multitud de otros seres vivos, producen el oxígeno que respiramos, mantienen el suelo, regulan la humedad y contribuyen a la estabilidad del clima. La mitad de los alimentos que consume la humanidad procede de sólo tres especies de plantas: el trigo, el arroz y el maíz. Más del 40% de las medicinas derivan de las plantas. Algunas se utilizan directamente, como las hierbas tradicionales. Otras se originan en el mundo vegetal, pero sufren complicados procesos de transformación.", 
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