import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/location/location_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/location_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/location/bloc/location_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'location_events.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;

  final streetAddressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateProvinceController = TextEditingController();

  LocationBloc({@required LocationRepository locationRepository}) : assert(locationRepository != null),
        _locationRepository = locationRepository, 
  super(LocationState());

  @override
  void onTransition(Transition<LocationEvent, LocationState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is InitLocationList) {
      yield* onInitList(event);
    } else if (event is LocationFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadLocationByIdForEdit) {
      yield* onLoadLocationIdForEdit(event);
    } else if (event is DeleteLocationById) {
      yield* onDeleteLocationId(event);
    } else if (event is LoadLocationByIdForView) {
      yield* onLoadLocationIdForView(event);
    }else if (event is StreetAddressChanged){
      yield* onStreetAddressChange(event);
    }else if (event is PostalCodeChanged){
      yield* onPostalCodeChange(event);
    }else if (event is CityChanged){
      yield* onCityChange(event);
    }else if (event is StateProvinceChanged){
      yield* onStateProvinceChange(event);
    }  }

  Stream<LocationState> onInitList(InitLocationList event) async* {
    yield this.state.copyWith(locationStatusUI: LocationStatusUI.loading);
    List<Location> locations = await _locationRepository.getAllLocations();
    yield this.state.copyWith(locations: locations, locationStatusUI: LocationStatusUI.done);
  }

  Stream<LocationState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Location result;
        if(this.state.editMode) {
          Location newLocation = Location(state.loadedLocation.id,
            this.state.streetAddress.value,  
            this.state.postalCode.value,  
            this.state.city.value,  
            this.state.stateProvince.value,  
            null, 
          );

          result = await _locationRepository.update(newLocation);
        } else {
          Location newLocation = Location(null,
            this.state.streetAddress.value,  
            this.state.postalCode.value,  
            this.state.city.value,  
            this.state.stateProvince.value,  
            null, 
          );

          result = await _locationRepository.create(newLocation);
        }

        if (result == null) {
          yield this.state.copyWith(formStatus: FormzStatus.submissionFailure,
              generalNotificationKey: HttpUtils.badRequestServerKey);
        } else {
          yield this.state.copyWith(formStatus: FormzStatus.submissionSuccess,
              generalNotificationKey: HttpUtils.successResult);
        }
      } catch (e) {
        yield this.state.copyWith(formStatus: FormzStatus.submissionFailure,
            generalNotificationKey: HttpUtils.errorServerKey);
      }
    }
  }

  Stream<LocationState> onLoadLocationIdForEdit(LoadLocationByIdForEdit event) async* {
    yield this.state.copyWith(locationStatusUI: LocationStatusUI.loading);
    Location loadedLocation = await _locationRepository.getLocation(event.id);

    final streetAddress = StreetAddressInput.dirty(loadedLocation?.streetAddress != null ? loadedLocation.streetAddress: '');
    final postalCode = PostalCodeInput.dirty(loadedLocation?.postalCode != null ? loadedLocation.postalCode: '');
    final city = CityInput.dirty(loadedLocation?.city != null ? loadedLocation.city: '');
    final stateProvince = StateProvinceInput.dirty(loadedLocation?.stateProvince != null ? loadedLocation.stateProvince: '');

    yield this.state.copyWith(loadedLocation: loadedLocation, editMode: true,
      streetAddress: streetAddress,
      postalCode: postalCode,
      city: city,
      stateProvince: stateProvince,
    locationStatusUI: LocationStatusUI.done);

    streetAddressController.text = loadedLocation.streetAddress;
    postalCodeController.text = loadedLocation.postalCode;
    cityController.text = loadedLocation.city;
    stateProvinceController.text = loadedLocation.stateProvince;
  }

  Stream<LocationState> onDeleteLocationId(DeleteLocationById event) async* {
    try {
      await _locationRepository.delete(event.id);
      this.add(InitLocationList());
      yield this.state.copyWith(deleteStatus: LocationDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: LocationDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: LocationDeleteStatus.none);
  }

  Stream<LocationState> onLoadLocationIdForView(LoadLocationByIdForView event) async* {
    yield this.state.copyWith(locationStatusUI: LocationStatusUI.loading);
    try {
      Location loadedLocation = await _locationRepository.getLocation(event.id);
      yield this.state.copyWith(loadedLocation: loadedLocation, locationStatusUI: LocationStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedLocation: null, locationStatusUI: LocationStatusUI.error);
    }
  }


  Stream<LocationState> onStreetAddressChange(StreetAddressChanged event) async* {
    final streetAddress = StreetAddressInput.dirty(event.streetAddress);
    yield this.state.copyWith(
      streetAddress: streetAddress,
      formStatus: Formz.validate([
        streetAddress,
      this.state.postalCode,
      this.state.city,
      this.state.stateProvince,
      ]),
    );
  }
  Stream<LocationState> onPostalCodeChange(PostalCodeChanged event) async* {
    final postalCode = PostalCodeInput.dirty(event.postalCode);
    yield this.state.copyWith(
      postalCode: postalCode,
      formStatus: Formz.validate([
      this.state.streetAddress,
        postalCode,
      this.state.city,
      this.state.stateProvince,
      ]),
    );
  }
  Stream<LocationState> onCityChange(CityChanged event) async* {
    final city = CityInput.dirty(event.city);
    yield this.state.copyWith(
      city: city,
      formStatus: Formz.validate([
      this.state.streetAddress,
      this.state.postalCode,
        city,
      this.state.stateProvince,
      ]),
    );
  }
  Stream<LocationState> onStateProvinceChange(StateProvinceChanged event) async* {
    final stateProvince = StateProvinceInput.dirty(event.stateProvince);
    yield this.state.copyWith(
      stateProvince: stateProvince,
      formStatus: Formz.validate([
      this.state.streetAddress,
      this.state.postalCode,
      this.state.city,
        stateProvince,
      ]),
    );
  }

  @override
  Future<void> close() {
    streetAddressController.dispose();
    postalCodeController.dispose();
    cityController.dispose();
    stateProvinceController.dispose();
    return super.close();
  }

}