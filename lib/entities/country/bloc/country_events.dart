part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitCountryList extends CountryEvent {}

class CountryNameChanged extends CountryEvent {
  final String countryName;
  
  const CountryNameChanged({@required this.countryName});
  
  @override
  List<Object> get props => [countryName];
}

class CountryFormSubmitted extends CountryEvent {}

class LoadCountryByIdForEdit extends CountryEvent {
  final int id;

  const LoadCountryByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteCountryById extends CountryEvent {
  final int id;

  const DeleteCountryById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadCountryByIdForView extends CountryEvent {
  final int id;

  const LoadCountryByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
