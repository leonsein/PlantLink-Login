import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_plantlink/bloc/plant_link_bloc.dart';
import 'package:login_plantlink/controllers/email_and_password_controller.dart';
import 'package:login_plantlink/views/welcome_view/welcome_view.dart';

void ResetPasswordView(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 5,
                  width: 50,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recupera tu cuenta',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Inserta tu correo electrónico\nEnviaremos un link para restablecer tu contraseña',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
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
                              controller: emailControllerps,
                              decoration: const InputDecoration(
                                  hintText: 'Correo electrónico',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: BlocBuilder<PlantLinkBloc, PlantLinkState>(
                    builder: (context, state) {
                      return MaterialButton(
                        color: Colors.amber,
                        onPressed: () {
                          context.read<PlantLinkBloc>().add(PlantLinkEventResetPassword(
                              emailps: emailControllerps.text));
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => CupertinoAlertDialog(
                              title: const Text('Correo enviado'),
                              content: const Text(
                                  'Se ha enviado un link a tu correo para restablecer tu contraseña'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Ok'),
                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeView())),
                                )
                              ],
                            ),
                          );
                        },
                        child: const Text('Envíar'),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
