part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitTaskList extends TaskEvent {}

class TitleChanged extends TaskEvent {
  final String title;
  
  const TitleChanged({@required this.title});
  
  @override
  List<Object> get props => [title];
}
class DescriptionChanged extends TaskEvent {
  final String description;
  
  const DescriptionChanged({@required this.description});
  
  @override
  List<Object> get props => [description];
}

class TaskFormSubmitted extends TaskEvent {}

class LoadTaskByIdForEdit extends TaskEvent {
  final int id;

  const LoadTaskByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteTaskById extends TaskEvent {
  final int id;

  const DeleteTaskById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadTaskByIdForView extends TaskEvent {
  final int id;

  const LoadTaskByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
