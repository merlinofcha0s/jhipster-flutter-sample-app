import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/person/person_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/person_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/person/bloc/person_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'person_events.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository _personRepository;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  PersonBloc({@required PersonRepository personRepository}) : assert(personRepository != null),
        _personRepository = personRepository, 
  super(PersonState());

  @override
  void onTransition(Transition<PersonEvent, PersonState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is InitPersonList) {
      yield* onInitList(event);
    } else if (event is PersonFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadPersonByIdForEdit) {
      yield* onLoadPersonIdForEdit(event);
    } else if (event is DeletePersonById) {
      yield* onDeletePersonId(event);
    } else if (event is LoadPersonByIdForView) {
      yield* onLoadPersonIdForView(event);
    }else if (event is FirstNameChanged){
      yield* onFirstNameChange(event);
    }else if (event is LastNameChanged){
      yield* onLastNameChange(event);
    }else if (event is EmailChanged){
      yield* onEmailChange(event);
    }else if (event is PhoneNumberChanged){
      yield* onPhoneNumberChange(event);
    }  }

  Stream<PersonState> onInitList(InitPersonList event) async* {
    yield this.state.copyWith(personStatusUI: PersonStatusUI.loading);
    List<Person> people = await _personRepository.getAllPeople();
    yield this.state.copyWith(people: people, personStatusUI: PersonStatusUI.done);
  }

  Stream<PersonState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Person result;
        if(this.state.editMode) {
          Person newPerson = Person(state.loadedPerson.id,
            this.state.firstName.value,  
            this.state.lastName.value,  
            this.state.email.value,  
            this.state.phoneNumber.value,  
          );

          result = await _personRepository.update(newPerson);
        } else {
          Person newPerson = Person(null,
            this.state.firstName.value,  
            this.state.lastName.value,  
            this.state.email.value,  
            this.state.phoneNumber.value,  
          );

          result = await _personRepository.create(newPerson);
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

  Stream<PersonState> onLoadPersonIdForEdit(LoadPersonByIdForEdit event) async* {
    yield this.state.copyWith(personStatusUI: PersonStatusUI.loading);
    Person loadedPerson = await _personRepository.getPerson(event.id);

    final firstName = FirstNameInput.dirty(loadedPerson?.firstName != null ? loadedPerson.firstName: '');
    final lastName = LastNameInput.dirty(loadedPerson?.lastName != null ? loadedPerson.lastName: '');
    final email = EmailInput.dirty(loadedPerson?.email != null ? loadedPerson.email: '');
    final phoneNumber = PhoneNumberInput.dirty(loadedPerson?.phoneNumber != null ? loadedPerson.phoneNumber: '');

    yield this.state.copyWith(loadedPerson: loadedPerson, editMode: true,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
    personStatusUI: PersonStatusUI.done);

    firstNameController.text = loadedPerson.firstName;
    lastNameController.text = loadedPerson.lastName;
    emailController.text = loadedPerson.email;
    phoneNumberController.text = loadedPerson.phoneNumber;
  }

  Stream<PersonState> onDeletePersonId(DeletePersonById event) async* {
    try {
      await _personRepository.delete(event.id);
      this.add(InitPersonList());
      yield this.state.copyWith(deleteStatus: PersonDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: PersonDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: PersonDeleteStatus.none);
  }

  Stream<PersonState> onLoadPersonIdForView(LoadPersonByIdForView event) async* {
    yield this.state.copyWith(personStatusUI: PersonStatusUI.loading);
    try {
      Person loadedPerson = await _personRepository.getPerson(event.id);
      yield this.state.copyWith(loadedPerson: loadedPerson, personStatusUI: PersonStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedPerson: null, personStatusUI: PersonStatusUI.error);
    }
  }


  Stream<PersonState> onFirstNameChange(FirstNameChanged event) async* {
    final firstName = FirstNameInput.dirty(event.firstName);
    yield this.state.copyWith(
      firstName: firstName,
      formStatus: Formz.validate([
        firstName,
      this.state.lastName,
      this.state.email,
      this.state.phoneNumber,
      ]),
    );
  }
  Stream<PersonState> onLastNameChange(LastNameChanged event) async* {
    final lastName = LastNameInput.dirty(event.lastName);
    yield this.state.copyWith(
      lastName: lastName,
      formStatus: Formz.validate([
      this.state.firstName,
        lastName,
      this.state.email,
      this.state.phoneNumber,
      ]),
    );
  }
  Stream<PersonState> onEmailChange(EmailChanged event) async* {
    final email = EmailInput.dirty(event.email);
    yield this.state.copyWith(
      email: email,
      formStatus: Formz.validate([
      this.state.firstName,
      this.state.lastName,
        email,
      this.state.phoneNumber,
      ]),
    );
  }
  Stream<PersonState> onPhoneNumberChange(PhoneNumberChanged event) async* {
    final phoneNumber = PhoneNumberInput.dirty(event.phoneNumber);
    yield this.state.copyWith(
      phoneNumber: phoneNumber,
      formStatus: Formz.validate([
      this.state.firstName,
      this.state.lastName,
      this.state.email,
        phoneNumber,
      ]),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }

}