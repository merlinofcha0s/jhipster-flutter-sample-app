part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitPersonList extends PersonEvent {}

class FirstNameChanged extends PersonEvent {
  final String firstName;
  
  const FirstNameChanged({@required this.firstName});
  
  @override
  List<Object> get props => [firstName];
}
class LastNameChanged extends PersonEvent {
  final String lastName;
  
  const LastNameChanged({@required this.lastName});
  
  @override
  List<Object> get props => [lastName];
}
class EmailChanged extends PersonEvent {
  final String email;
  
  const EmailChanged({@required this.email});
  
  @override
  List<Object> get props => [email];
}
class PhoneNumberChanged extends PersonEvent {
  final String phoneNumber;
  
  const PhoneNumberChanged({@required this.phoneNumber});
  
  @override
  List<Object> get props => [phoneNumber];
}

class PersonFormSubmitted extends PersonEvent {}

class LoadPersonByIdForEdit extends PersonEvent {
  final int id;

  const LoadPersonByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeletePersonById extends PersonEvent {
  final int id;

  const DeletePersonById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadPersonByIdForView extends PersonEvent {
  final int id;

  const LoadPersonByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
