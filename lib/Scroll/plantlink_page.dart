import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_plantlink/Scroll/nosotros_page.dart';
import 'package:login_plantlink/Scroll/plagas_page.dart';
import 'package:login_plantlink/Scroll/sensors_page.dart';
import 'package:login_plantlink/views/welcome_view/welcome_view.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../Google Auth/google.dart';
import '../bloc/plant_link_bloc.dart';
import '../listview scroll/product.dart';

class PlantLinkPage extends StatefulWidget {
  const PlantLinkPage({super.key});

  @override
  State<PlantLinkPage> createState() => _PlantLinkPageState();
}

class _PlantLinkPageState extends State<PlantLinkPage> {
  List<Product> productList = [
    Product('assets/12.jpg', 'Black Chair', 90, 15),
    Product('assets/backplantlink.jpg', 'Awesome Sofa', 100, 10),
    Product('assets/cplagas.jpg', 'Copper Lamp', 10, 25),
    Product('assets/backcatarina.jpg', 'Copper', 10, 25),
  ];

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

  /*@override
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
                            if (categoriaselect[index] == 'Plagas') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlagasPage(),
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
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: productList.length,
                  itemSize: 150,
                  onItemFocus: (index) {},
                  dynamicItemSize: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              //Lottie.asset('assets/plant.json', width: 100, fit: BoxFit.cover, reverse: true),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),
                child: const Text(
                  "PlantLink fue elaborado de manera independiente con el objetivo de ser una empresa dedicada al control de plagas, a través de técnicas innovadoras de alta calidad, tecnología y costos competitivos. Con nuestra solución podrás disfrutar de un ambiente saludable para tus plantas y una forma fácil y efectiva de monitorear su salud y crecimiento.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  /*@override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                            if (categoriaselect[index] == 'Plagas') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlagasPage(),
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
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: productList.length,
                  itemSize: 150,
                  onItemFocus: (index) {},
                  dynamicItemSize: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              //Lottie.asset('assets/plant.json', width: 100, fit: BoxFit.cover, reverse: true),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),
                child: const Text(
                  "PlantLink fue elaborado de manera independiente con el objetivo de ser una empresa dedicada al control de plagas, a través de técnicas innovadoras de alta calidad, tecnología y costos competitivos. Con nuestra solución podrás disfrutar de un ambiente saludable para tus plantas y una forma fácil y efectiva de monitorear su salud y crecimiento.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      children: [
                        Image.asset(
                          "assets/plantlink.png",
                          height: height * 0.09,
                        ),
                        IconButton(
                          onPressed: () async {
                            await Authenticator.cerrarSesion();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      WelcomeView()),
                              (route) => false,
                            );
                            context
                                .read<PlantLinkBloc>()
                                .add(PlantLinkEventLogOut());
                          },
                          icon: Icon(
                            Icons.logout_outlined,
                            size: 30,
                          ),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          splashColor: const Color.fromARGB(0, 255, 255, 255),
                          highlightColor: Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
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
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: productList.length,
                  itemSize: 150,
                  onItemFocus: (index) {},
                  dynamicItemSize: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              //Lottie.asset('assets/plant.json', width: 100, fit: BoxFit.cover, reverse: true),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.08,
                ),
                child: const Text(
                  "PlantLink fue elaborado de manera independiente con el objetivo de ser una empresa dedicada al monitoreo de plantas, a través de técnicas innovadoras de alta calidad, tecnología y costos competitivos. Con nuestra solución podrás disfrutar de un ambiente saludable para tus plantas y una forma fácil y efectiva de monitorear su salud y crecimiento.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          child: Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
            width: 150,
            height: 180,
          ),
        ),
      ),
    );
  }
}


/*floatingActionButton: ElevatedButton(
        onPressed: () =>
            context.read<PlantLinkBloc>().add(PlantLinkEventLogOut()),
        child: Text('Cerrar sesión'),
      ),*/