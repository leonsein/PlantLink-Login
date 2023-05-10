import 'package:flutter/material.dart';
import 'package:login_plantlink/Nosotros/mision.dart';
import 'package:login_plantlink/Scroll/plagas_page.dart';
import 'package:login_plantlink/Scroll/plantlink_page.dart';
import 'package:login_plantlink/Scroll/sensors_page.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class NosotrosPage extends StatefulWidget {
  const NosotrosPage({super.key});

  @override
  State<NosotrosPage> createState() => _NosotrosPageState();
}

class _NosotrosPageState extends State<NosotrosPage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: 'dbsensors.web.app');
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  List categoria = [
    "PlantLink",
    "Nosotros",
    "Sensores",
    "Consejos",
  ];

  List categoriaselect = [
    "PlantLink",
    "Nosotros",
    "Sensores",
    "Consejos",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
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
                          "PlantLink",
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
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.09,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 72, 72, 72),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Buscar",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.07,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoria.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: width * 0.09,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (categoriaselect[index] == 'PlantLink') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlantLinkPage(),
                                ),
                              );
                            }
                            if (categoriaselect[index] == 'Nosotros') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NosotrosPage(),
                                ),
                              );
                            }
                            if (categoriaselect[index] == 'Sensores') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SensorsPage(),
                                ),
                              );
                            }
                            if (categoriaselect[index] == 'Consejos') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ConsejosPage(),
                                ),
                              );
                            }
                            setState(() {
                              categoriaselect = [
                                false,
                                false,
                                false,
                                false,
                              ];
                              categoriaselect[index] = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                categoria[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: categoriaselect[index] == true
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 116, 114, 114)),
                              ),
                              Container(
                                height: height * 0.002,
                                width: width * 0.035,
                                color: categoriaselect[index] == true
                                    ? const Color.fromARGB(255, 0, 154, 43)
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //SizedBox(height: 20,),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 250,
                  width: 500,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
                        image: AssetImage("assets/plantal.png"),
                        alignment: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 150, 147, 147),
                          offset: Offset(-5.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          blurRadius: 0.0,
                          //spreadRadius: 3.0,
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "PlantLink",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "'Planta un arbol \ny estarás plantando \nconciencia'.",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      height: 100,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          /*image: DecorationImage(
                            image: AssetImage("assets/plantlink.png"),
                            alignment: Alignment.centerRight,
                          ),*/
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 147, 147),
                              offset: Offset(-5.0, 5.0),
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              blurRadius: 0.0,
                              //spreadRadius: 3.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Nosotros",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MisionPage(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.output,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      height: 100,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          /*image: DecorationImage(
                        image: AssetImage("assets/cultivo.jpg"),
                        alignment: Alignment.centerRight,
                      ),*/
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 147, 147),
                              offset: Offset(-5.0, 5.0),
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              blurRadius: 0.0,
                              //spreadRadius: 3.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Página web",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchURL("https://dbsensors.web.app/");
                              },
                              child: const Icon(
                                Icons.web,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             
              const SizedBox(
                height: 15,
              ),
               Lottie.asset('assets/plantitas.json', width: 450, fit: BoxFit.cover, reverse: true),
            ],
          ),
        ),
      ),
    );
  }
}
