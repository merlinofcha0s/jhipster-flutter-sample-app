import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/country/country_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/country/country_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/country/bloc/country_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'country_events.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository _countryRepository;

  final countryNameController = TextEditingController();

  CountryBloc({@required CountryRepository countryRepository}) : assert(countryRepository != null),
        _countryRepository = countryRepository, 
  super(CountryState());

  @override
  void onTransition(Transition<CountryEvent, CountryState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is InitCountryList) {
      yield* onInitList(event);
    } else if (event is CountryFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadCountryByIdForEdit) {
      yield* onLoadCountryIdForEdit(event);
    } else if (event is DeleteCountryById) {
      yield* onDeleteCountryId(event);
    } else if (event is LoadCountryByIdForView) {
      yield* onLoadCountryIdForView(event);
    }else if (event is CountryNameChanged){
      yield* onCountryNameChange(event);
    }  }

  Stream<CountryState> onInitList(InitCountryList event) async* {
    yield this.state.copyWith(countryStatusUI: CountryStatusUI.loading);
    List<Country> countries = await _countryRepository.getAllCountries();
    yield this.state.copyWith(countries: countries, countryStatusUI: CountryStatusUI.done);
  }

  Stream<CountryState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Country result;
        if(this.state.editMode) {
          Country newCountry = Country(state.loadedCountry.id,
            this.state.countryName.value,  
            null, 
          );

          result = await _countryRepository.update(newCountry);
        } else {
          Country newCountry = Country(null,
            this.state.countryName.value,  
            null, 
          );

          result = await _countryRepository.create(newCountry);
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

  Stream<CountryState> onLoadCountryIdForEdit(LoadCountryByIdForEdit event) async* {
    yield this.state.copyWith(countryStatusUI: CountryStatusUI.loading);
    Country loadedCountry = await _countryRepository.getCountry(event.id);

    final countryName = CountryNameInput.dirty(loadedCountry?.countryName != null ? loadedCountry.countryName: '');

    yield this.state.copyWith(loadedCountry: loadedCountry, editMode: true,
      countryName: countryName,
    countryStatusUI: CountryStatusUI.done);

    countryNameController.text = loadedCountry.countryName;
  }

  Stream<CountryState> onDeleteCountryId(DeleteCountryById event) async* {
    try {
      await _countryRepository.delete(event.id);
      this.add(InitCountryList());
      yield this.state.copyWith(deleteStatus: CountryDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: CountryDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: CountryDeleteStatus.none);
  }

  Stream<CountryState> onLoadCountryIdForView(LoadCountryByIdForView event) async* {
    yield this.state.copyWith(countryStatusUI: CountryStatusUI.loading);
    try {
      Country loadedCountry = await _countryRepository.getCountry(event.id);
      yield this.state.copyWith(loadedCountry: loadedCountry, countryStatusUI: CountryStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedCountry: null, countryStatusUI: CountryStatusUI.error);
    }
  }


  Stream<CountryState> onCountryNameChange(CountryNameChanged event) async* {
    final countryName = CountryNameInput.dirty(event.countryName);
    yield this.state.copyWith(
      countryName: countryName,
      formStatus: Formz.validate([
        countryName,
      ]),
    );
  }

  @override
  Future<void> close() {
    countryNameController.dispose();
    return super.close();
  }

}