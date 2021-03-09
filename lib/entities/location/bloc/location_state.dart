part of 'location_bloc.dart';

enum LocationStatusUI {init, loading, error, done}
enum LocationDeleteStatus {ok, ko, none}

class LocationState extends Equatable {
  final List<Location> locations;
  final Location loadedLocation;
  final bool editMode;
  final LocationDeleteStatus deleteStatus;
  final LocationStatusUI locationStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final StreetAddressInput streetAddress;
  final PostalCodeInput postalCode;
  final CityInput city;
  final StateProvinceInput stateProvince;

  
  LocationState(
{
    this.locations = const [],
    this.locationStatusUI = LocationStatusUI.init,
    this.loadedLocation = const Location(0,'','','','',null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = LocationDeleteStatus.none,
    this.streetAddress = const StreetAddressInput.pure(),
    this.postalCode = const PostalCodeInput.pure(),
    this.city = const CityInput.pure(),
    this.stateProvince = const StateProvinceInput.pure(),
  });

  LocationState copyWith({
    List<Location> locations,
    LocationStatusUI locationStatusUI,
    bool editMode,
    LocationDeleteStatus deleteStatus,
    Location loadedLocation,
    FormzStatus formStatus,
    String generalNotificationKey,
    StreetAddressInput streetAddress,
    PostalCodeInput postalCode,
    CityInput city,
    StateProvinceInput stateProvince,
  }) {
    return LocationState(
      locations: locations ?? this.locations,
      locationStatusUI: locationStatusUI ?? this.locationStatusUI,
      loadedLocation: loadedLocation ?? this.loadedLocation,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      streetAddress: streetAddress ?? this.streetAddress,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      stateProvince: stateProvince ?? this.stateProvince,
    );
  }

  @override
  List<Object> get props => [locations, locationStatusUI,
     loadedLocation, editMode, deleteStatus, formStatus, generalNotificationKey, 
streetAddress,postalCode,city,stateProvince,];

  @override
  bool get stringify => true;
}
