import 'package:flutter/material.dart';

class MQ7 extends StatefulWidget {
  const MQ7({super.key});

  @override
  State<MQ7> createState() => _MQ7State();
}

class _MQ7State extends State<MQ7> {
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
                          image: AssetImage("assets/mq7.jpg"),
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
                  "MQ-7", 
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
                    "El Módulo MQ-7 es un sensor electro-químico que varia su resistencia al estar contacto con monóxido de carbono en el aire. Contiene electrónica básica para poder realizar la interfaz con un microcontrolador, cuenta con 2 salidas una analógica y una digital. El MQ-7 puede detectar concentraciones de Monóxido de carbono en el rango de 20 a 2000 ppm (partes por millón). Cuenta con un potenciómetro para ajustar la sensibilidad del sensor. El sensor MQ-7 tiene una conductividad baja cuando el aire es limpio. Cuando el sensor detecta el Monóxido de carbono la conductividad de los sensores es más alto junto con el aumento de la concentración de gas. Se utiliza un electro circuito que convierte el cambio de conductividad para que corresponda con la señal de salida de la concentración de gas.", 
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