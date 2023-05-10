import 'package:flutter/material.dart';
import 'package:login_plantlink/Scroll/nosotros_page.dart';
import 'package:login_plantlink/Scroll/plagas_page.dart';
import 'package:login_plantlink/Scroll/plantlink_page.dart';
import 'package:login_plantlink/item.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({Key? key}) : super(key: key);

  @override
  State<SensorsPage> createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {

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

  List imageitem = [
    "assets/dht11.jpg",
    "assets/fc28.jpg",
    "assets/mq7.jpg",
    "assets/ldr.jpg",
  ];

  List nameitem = [
    "DHT11",
    "FC-28",
    "MQ-7",
    "LDR",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                            if(categoriaselect[index] == 'PlantLink'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlantLinkPage(),),);
                            }
                            if(categoriaselect[index] == 'Nosotros'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NosotrosPage(),),);
                            }
                            if(categoriaselect[index] == 'Sensores'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SensorsPage(),),);
                            }
                            if(categoriaselect[index] == 'Consejos'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ConsejosPage(),),);
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
              Expanded(
                  child: GridView.builder(
                itemCount: nameitem.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Center(
                    child: Item(
                      image: imageitem[index],
                      name: nameitem[index],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

