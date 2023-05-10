import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:login_plantlink/Google%20Auth/google.dart';
import 'package:login_plantlink/Scroll/plantlink_page.dart';
import 'package:login_plantlink/auth/auth_error.dart';
import 'package:login_plantlink/bloc/plant_link_bloc.dart';
import 'package:login_plantlink/controllers/email_and_password_controller.dart';
import 'package:login_plantlink/views/home_view/home_view.dart';

import '../../Facebook Auth/facebook.dart';
import '../reset_password_view/reset_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool visiblePassword = true;
  final Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantLinkBloc, PlantLinkState>(
      builder: (context, state) {
        if (state is PlantLinkStateLoggedIn) {
          return const HomeView();
        }
        if (state is PlantLinkStateLoggedOut) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Aquí va tu correo electrónico y contraseña',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.alternate_email,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextField(
                              controller: emailController,
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber)),
                                  hintText: 'Correo electrónico',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade500),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade500))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.password,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: TextField(
                              onSubmitted: (value) {
                                context.read<PlantLinkBloc>().add(
                                    PlantLinkEventLogIn(
                                        email: emailController.text,
                                        password: passwordController.text));
                              },
                              controller: passwordController,
                              autofocus: true,
                              obscureText: visiblePassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: visiblePassword
                                          ? Colors.grey.shade500
                                          : Colors.amber,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visiblePassword = !visiblePassword;
                                      });
                                    },
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber),
                                  ),
                                  hintText: 'Contraseña',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade500),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade500))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: authErrorlogin != ''
                        ? Text(
                            textAlign: TextAlign.center,
                            authErrorlogin.split(']')[1],
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          state.isLoading
                              ? const CircularProgressIndicator()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () {
                                        context.read<PlantLinkBloc>().add(
                                            PlantLinkEventLogIn(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      },
                                      color: Colors.amber,
                                      child: const Text('Iniciar sesión'),
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                                onPressed: () {
                                  ResetPasswordView(context);
                                },
                                child: const Text('¿Olvidaste tu contraseña?')),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () async {
                                      try {
                                        User? user =
                                            await Authenticator.iniciarSesion(
                                                context: context);
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PlantLinkPage()),
                                          );
                                        }
                                      } catch (e) {
                                        // Manejar la excepción aquí y mostrar un mensaje de error
                                        print(
                                            "Error al iniciar sesión con Google: $e");
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/google.png',
                                            height: 30,
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                              'Iniciar sesión con Google'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3b5998),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            'https://www.facebook.com/images/fb_icon_325x325.png',
                                            height: 30,
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            'Iniciar sesión con Facebook',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
