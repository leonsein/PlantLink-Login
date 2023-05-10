part of 'plant_link_bloc.dart';

abstract class PlantLinkState extends Equatable {
  final bool isLoading;
  final bool successful;
  const PlantLinkState({required this.isLoading, required this.successful});
}

class PlantLinkStateLoggedIn extends PlantLinkState {
  const PlantLinkStateLoggedIn({
    required isLoading, 
    required successful
    }) : super(isLoading: isLoading, successful: successful);
    
      @override
      // TODO: implement props
      List<Object?> get props => [isLoading, successful];
}

class PlantLinkStateLoggedOut extends PlantLinkState {
  const PlantLinkStateLoggedOut({
    required isLoading, 
    required successful
    }) : super(isLoading: isLoading, successful: successful);
    
      @override
      // TODO: implement props
      List<Object?> get props => [isLoading, successful];
}
