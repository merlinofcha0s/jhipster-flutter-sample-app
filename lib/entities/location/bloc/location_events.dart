part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitLocationList extends LocationEvent {}

class StreetAddressChanged extends LocationEvent {
  final String streetAddress;
  
  const StreetAddressChanged({@required this.streetAddress});
  
  @override
  List<Object> get props => [streetAddress];
}
class PostalCodeChanged extends LocationEvent {
  final String postalCode;
  
  const PostalCodeChanged({@required this.postalCode});
  
  @override
  List<Object> get props => [postalCode];
}
class CityChanged extends LocationEvent {
  final String city;
  
  const CityChanged({@required this.city});
  
  @override
  List<Object> get props => [city];
}
class StateProvinceChanged extends LocationEvent {
  final String stateProvince;
  
  const StateProvinceChanged({@required this.stateProvince});
  
  @override
  List<Object> get props => [stateProvince];
}

class LocationFormSubmitted extends LocationEvent {}

class LoadLocationByIdForEdit extends LocationEvent {
  final int id;

  const LoadLocationByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteLocationById extends LocationEvent {
  final int id;

  const DeleteLocationById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadLocationByIdForView extends LocationEvent {
  final int id;

  const LoadLocationByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
