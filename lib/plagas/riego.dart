import 'package:flutter/material.dart';

class Riego extends StatefulWidget {
  const Riego({super.key});

  @override
  State<Riego> createState() => _RiegoState();
}

class _RiegoState extends State<Riego> {
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
                          image: AssetImage("assets/riego.jpg"),
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
                  "Riego", 
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
                    "Aunque el riego es esencial para el crecimiento de las plantas, es importante no excederse ya que el exceso de agua puede ahogar las raíces y provocar la muerte de la planta. Un riego moderado significa mojar el sustrato sin llegar a empaparlo del todo. Las plantas que exigen un riego de este tipo son algunas suculentas y las plantas que almacenan nutrientes y reservan agua en sus raíces (bulbos, rizomas, tubérculos, raíces tuberosas). En este caso, lo normal es regarlas 2 o 3 veces por semana en verano y una vez cada 10 días en invierno. Además de la frecuencia y la cantidad, también puede variar la forma de regar la planta. Algunas hay que regarlas desde arriba, directamente sobre la tierra, sin mojar las hojas. Otras se riegan colocando agua en el plato, bajo la maceta, para que la tierra la absorba a través de los agujeros de drenaje.", 
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