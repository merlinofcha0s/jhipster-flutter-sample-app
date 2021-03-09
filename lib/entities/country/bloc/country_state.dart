part of 'country_bloc.dart';

enum CountryStatusUI {init, loading, error, done}
enum CountryDeleteStatus {ok, ko, none}

class CountryState extends Equatable {
  final List<Country> countries;
  final Country loadedCountry;
  final bool editMode;
  final CountryDeleteStatus deleteStatus;
  final CountryStatusUI countryStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final CountryNameInput countryName;

  
  CountryState(
{
    this.countries = const [],
    this.countryStatusUI = CountryStatusUI.init,
    this.loadedCountry = const Country(0,'',null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = CountryDeleteStatus.none,
    this.countryName = const CountryNameInput.pure(),
  });

  CountryState copyWith({
    List<Country> countries,
    CountryStatusUI countryStatusUI,
    bool editMode,
    CountryDeleteStatus deleteStatus,
    Country loadedCountry,
    FormzStatus formStatus,
    String generalNotificationKey,
    CountryNameInput countryName,
  }) {
    return CountryState(
      countries: countries ?? this.countries,
      countryStatusUI: countryStatusUI ?? this.countryStatusUI,
      loadedCountry: loadedCountry ?? this.loadedCountry,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      countryName: countryName ?? this.countryName,
    );
  }

  @override
  List<Object> get props => [countries, countryStatusUI,
     loadedCountry, editMode, deleteStatus, formStatus, generalNotificationKey, 
countryName,];

  @override
  bool get stringify => true;
}
