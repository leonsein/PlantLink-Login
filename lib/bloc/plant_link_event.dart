part of 'plant_link_bloc.dart';

abstract class PlantLinkEvent extends Equatable {
  const PlantLinkEvent();
}

@immutable
class PlantLinkEventLogOut extends PlantLinkEvent{
  const PlantLinkEventLogOut();
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class PlantLinkEventLogIn extends PlantLinkEvent{
  final String email;
  final String password;
  const PlantLinkEventLogIn({required this.email, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

@immutable
class PlantLinkEventRegister extends PlantLinkEvent{
  final String email;
  final String password;
  const PlantLinkEventRegister({required this.email, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

@immutable
class PlantLinkEventResetPassword extends PlantLinkEvent{
  final String emailps;
  const PlantLinkEventResetPassword({required this.emailps});
  
  @override
  // TODO: implement props
  List<Object?> get props => [emailps];
}
