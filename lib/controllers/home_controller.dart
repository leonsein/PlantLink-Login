import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_plantlink/auth/auth.dart';
import 'package:login_plantlink/bloc/plant_link_bloc.dart';
import 'package:login_plantlink/views/home_view/home_view.dart';
import 'package:login_plantlink/views/welcome_view/welcome_view.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<PlantLinkBloc, PlantLinkState>(
          builder: (context, state) {
            if(state is PlantLinkStateLoggedIn || snapshot.hasData){
              return const HomeView();
            }
            if(state is PlantLinkStateLoggedOut){
              return const WelcomeView();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}