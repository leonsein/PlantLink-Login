import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_plantlink/bloc/plant_link_bloc.dart';
import 'package:login_plantlink/controllers/email_and_password_controller.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Center(
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
                      'Inserta una contraseña',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Aquí va tu contraseña',
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
                        controller: passwordController,
                        obscureText: visiblePassword,
                        autofocus: true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblePassword = !visiblePassword;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: visiblePassword
                                      ? Colors.grey.shade500
                                      : Colors.amber,
                                )),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<PlantLinkBloc, PlantLinkState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.center,
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<PlantLinkBloc>().add(PlantLinkEventRegister(
                                      email: emailController.text,
                                      password: passwordController.text));
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                color: Colors.amber,
                                child: const Text('Confirmar'),
                              ),
                            ),
                          ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
