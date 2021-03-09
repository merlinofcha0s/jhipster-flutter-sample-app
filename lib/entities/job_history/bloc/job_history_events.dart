part of 'job_history_bloc.dart';

abstract class JobHistoryEvent extends Equatable {
  const JobHistoryEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitJobHistoryList extends JobHistoryEvent {}

class StartDateChanged extends JobHistoryEvent {
  final DateTime startDate;
  
  const StartDateChanged({@required this.startDate});
  
  @override
  List<Object> get props => [startDate];
}
class EndDateChanged extends JobHistoryEvent {
  final DateTime endDate;
  
  const EndDateChanged({@required this.endDate});
  
  @override
  List<Object> get props => [endDate];
}
class LanguageChanged extends JobHistoryEvent {
  final Language language;
  
  const LanguageChanged({@required this.language});
  
  @override
  List<Object> get props => [language];
}

class JobHistoryFormSubmitted extends JobHistoryEvent {}

class LoadJobHistoryByIdForEdit extends JobHistoryEvent {
  final int id;

  const LoadJobHistoryByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteJobHistoryById extends JobHistoryEvent {
  final int id;

  const DeleteJobHistoryById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadJobHistoryByIdForView extends JobHistoryEvent {
  final int id;

  const LoadJobHistoryByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
