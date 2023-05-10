import 'package:flutter/material.dart';
import 'package:login_plantlink/plagas/ambienteadecuado.dart';

import 'package:login_plantlink/plagas/riego.dart';


import 'package:login_plantlink/plagas/conoceplantas.dart';
import 'package:login_plantlink/plagas/calidadaire.dart';
import 'package:login_plantlink/plagas/expoluz.dart';
import 'package:login_plantlink/sensors/dht11.dart';
import 'package:login_plantlink/sensors/fc28.dart';
import 'package:login_plantlink/sensors/ldr.dart';
import 'package:login_plantlink/sensors/mq7.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 64, 64, 64),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.09,
                      ),
                      Center(
                          child: Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 0.03,),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: (){
                            if (name == 'DHT11'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const DHT11(),),);
                            }
                            if (name == 'FC-28'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const FC28(),),);
                            }
                            if (name == 'MQ-7'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MQ7(),),);
                            }
                            if (name == 'LDR'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LDR(),),);
                            }
                            if (name == 'Conoce tus plantas'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CPlantas(),),);
                            }
                            if (name == 'Exposición a la luz'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpoL(),),);
                            }
                            if (name == 'Riego'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Riego(),),);
                            }
                            if (name == 'Ambiente adecuado'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Ambiente(),),);
                            }
                            if (name == 'Calidad de aire'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CAire(),),);
                            }
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded), 
                          alignment: Alignment.center, 
                          color: Colors.black,
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(radius: height * 0.06, backgroundImage: AssetImage(image),),
            ),
          ],
        ),
    );
  }
}
