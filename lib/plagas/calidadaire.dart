import 'package:flutter/material.dart';

class CAire extends StatefulWidget {
  const CAire({super.key});

  @override
  State<CAire> createState() => _CAireState();
}

class _CAireState extends State<CAire> {
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
                          image: AssetImage("assets/aire.jpg"),
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
                  "Calidad de aire", 
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
                    "Es importante mantener a tus plantas alejadas de áreas con mucho tráfico o exposición al humo y gas. Estos contaminantes pueden dañar la salud de tus plantas y reducir su crecimiento. Además, asegúrate de revisar regularmente el sensor de gas y humo. Las plantas contribuyen a mejorar la calidad del aire por distintos motivos. En primer lugar, absorben el dióxido de carbono y liberan a cambio oxígeno a través del proceso de la fotosíntesis. También los vegetales suben la humedad del aire interior, a través de la llamada evapotranspiración realizada por los poros de sus hojas. «Pero es que, además, absorben microcontaminantes del aire, tanto a través de la superficie externa de las hojas como a través de su sistema de raíces«, dice el fisiólogo vegetal Federico Brilli, coordinador del estudio. ", 
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
 