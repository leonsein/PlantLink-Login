import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ESP8266Page extends StatefulWidget {
  const ESP8266Page({super.key});

  @override
  State<ESP8266Page> createState() => _ESP8266PageState();
}

class _ESP8266PageState extends State<ESP8266Page> {

  final ref = FirebaseDatabase.instance.ref("Centinel01/Sensores/IntensidadLuz");
  //final ref1 = FirebaseDatabase.instance.ref("Centinel01/Sensores/Humedad");
  //final ref2 = FirebaseDatabase.instance.ref("Centinel01/Sensores/Gas");
  //final ref3 = FirebaseDatabase.instance.ref("Centinel01/Sensores/Smoke");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sensores"),
      ),
      body: Column(
        children: [
          Image.asset("assets/dht11.jpg", width: 80, height: 80,),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(snapshot.child('IntensidadLuz').value.toString()),
                        //Text(snapshot.child('').value.toString()),
                      ],
                    ),
                    //subtitle: Text(snapshot.child('valorT').value.toString()),
                  );
                }),
          ),
          /*Image.asset("assets/dht11.jpg", width: 80, height: 80,),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref1,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(snapshot.child('Humedad').value.toString()),
                        Text(snapshot.child('Valor').value.toString()),
                      ],
                    ),
                  );
                }),
          ),
          Image.asset("assets/fc28.jpg", width: 80, height: 80,),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref2,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(snapshot.child('Gas').value.toString()),
                      ],
                    ),
                  );
                }),
          ),
          Image.asset("assets/ldr.jpg", width: 80, height: 80,),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref3,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(snapshot.child('Gas').value.toString(), ),
                      ],
                    ),
                  );
                }),
          ),*/
        ],
      ),
    );
  }
}


    /*return Scaffold(
      appBar: AppBar(
        title: Text("Sensores"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('Tiempo').value.toString()),
                  );
                }),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref1,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('Tiempo').value.toString()),
                  );
                }),
          ),
        ],
      ),
    );*/

/*return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => context.read<PlantLinkBloc>().add(PlantLinkEventLogOut()),
            child: Text('Sign out'),
      ),
    ));*/
