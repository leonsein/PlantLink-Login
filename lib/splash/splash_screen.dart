import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_plantlink/controllers/home_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx) => const ScreenController()))
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/plantlink.png"), 
            width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitSpinningLines(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
