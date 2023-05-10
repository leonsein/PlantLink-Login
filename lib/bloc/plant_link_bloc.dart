import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:login_plantlink/auth/auth.dart';
import 'package:login_plantlink/auth/auth_error.dart';

part 'plant_link_event.dart';
part 'plant_link_state.dart';

class PlantLinkBloc extends Bloc<PlantLinkEvent, PlantLinkState> {
  PlantLinkBloc() : super(const PlantLinkStateLoggedOut(isLoading: false, successful: false)) {
    on<PlantLinkEventLogIn>((event, emit) async {
      emit(const PlantLinkStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const PlantLinkStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorlogin = e.toString();
        emit(const PlantLinkStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<PlantLinkEventLogOut>((event, emit) async {
      emit(const PlantLinkStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signOut();
        emit(const PlantLinkStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException {

      }
    });

     on<PlantLinkEventRegister>((event, emit) async {
      emit(const PlantLinkStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const PlantLinkStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorRegister = e.toString();
        emit(const PlantLinkStateLoggedOut(isLoading: false, successful: false));
      }
    });

     on<PlantLinkEventResetPassword>((event, emit) async {
      emit(const PlantLinkStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().sendResetPasswordEmail(
            emailps : event.emailps);
        emit(const PlantLinkStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorlogin = e.toString();
        emit(const PlantLinkStateLoggedOut(isLoading: false, successful: false));
      }
    });
  }
}
