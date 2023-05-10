import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_plantlink/Scroll/plantlink_page.dart';
import 'package:login_plantlink/views/welcome_view/welcome_view.dart';

class Authenticator {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSignIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSignInAccount =
    await objGoogleSignIn.signIn();

    /*if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeView()));
    }*/

    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication.accessToken,
          idToken: objGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);

        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticación");
      }
    }
  }

  static Future<void> cerrarSesion() async {
  FirebaseAuth authenticator = FirebaseAuth.instance;

  // Obtener el objeto GoogleSignIn
  GoogleSignIn objGoogleSignIn = GoogleSignIn();

  // Verificar si el usuario ha iniciado sesión en Google
  if (await objGoogleSignIn.isSignedIn()) {
    // Si el usuario ha iniciado sesión, cerrar la sesión en Firebase y Google
    await authenticator.signOut();
    await objGoogleSignIn.signOut();

    print("Sesión cerrada");
  } else {
    // Si el usuario no ha iniciado sesión en Google, imprimir un mensaje de error
    print("No se ha iniciado sesión en Google");
  }
}

}