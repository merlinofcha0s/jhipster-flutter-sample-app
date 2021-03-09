part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitJobList extends JobEvent {}

class JobTitleChanged extends JobEvent {
  final String jobTitle;
  
  const JobTitleChanged({@required this.jobTitle});
  
  @override
  List<Object> get props => [jobTitle];
}
class MinSalaryChanged extends JobEvent {
  final int minSalary;
  
  const MinSalaryChanged({@required this.minSalary});
  
  @override
  List<Object> get props => [minSalary];
}
class MaxSalaryChanged extends JobEvent {
  final int maxSalary;
  
  const MaxSalaryChanged({@required this.maxSalary});
  
  @override
  List<Object> get props => [maxSalary];
}

class JobFormSubmitted extends JobEvent {}

class LoadJobByIdForEdit extends JobEvent {
  final int id;

  const LoadJobByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteJobById extends JobEvent {
  final int id;

  const DeleteJobById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadJobByIdForView extends JobEvent {
  final int id;

  const LoadJobByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
