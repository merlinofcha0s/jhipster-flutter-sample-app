part of 'person_bloc.dart';

enum PersonStatusUI {init, loading, error, done}
enum PersonDeleteStatus {ok, ko, none}

class PersonState extends Equatable {
  final List<Person> people;
  final Person loadedPerson;
  final bool editMode;
  final PersonDeleteStatus deleteStatus;
  final PersonStatusUI personStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final FirstNameInput firstName;
  final LastNameInput lastName;
  final EmailInput email;
  final PhoneNumberInput phoneNumber;

  
  PersonState(
{
    this.people = const [],
    this.personStatusUI = PersonStatusUI.init,
    this.loadedPerson = const Person(0,'','','','',),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = PersonDeleteStatus.none,
    this.firstName = const FirstNameInput.pure(),
    this.lastName = const LastNameInput.pure(),
    this.email = const EmailInput.pure(),
    this.phoneNumber = const PhoneNumberInput.pure(),
  });

  PersonState copyWith({
    List<Person> people,
    PersonStatusUI personStatusUI,
    bool editMode,
    PersonDeleteStatus deleteStatus,
    Person loadedPerson,
    FormzStatus formStatus,
    String generalNotificationKey,
    FirstNameInput firstName,
    LastNameInput lastName,
    EmailInput email,
    PhoneNumberInput phoneNumber,
  }) {
    return PersonState(
      people: people ?? this.people,
      personStatusUI: personStatusUI ?? this.personStatusUI,
      loadedPerson: loadedPerson ?? this.loadedPerson,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [people, personStatusUI,
     loadedPerson, editMode, deleteStatus, formStatus, generalNotificationKey, 
firstName,lastName,email,phoneNumber,];

  @override
  bool get stringify => true;
}
