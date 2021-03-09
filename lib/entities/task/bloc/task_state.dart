part of 'task_bloc.dart';

enum TaskStatusUI {init, loading, error, done}
enum TaskDeleteStatus {ok, ko, none}

class TaskState extends Equatable {
  final List<Task> tasks;
  final Task loadedTask;
  final bool editMode;
  final TaskDeleteStatus deleteStatus;
  final TaskStatusUI taskStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final TitleInput title;
  final DescriptionInput description;

  
  TaskState(
{
    this.tasks = const [],
    this.taskStatusUI = TaskStatusUI.init,
    this.loadedTask = const Task(0,'','',),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = TaskDeleteStatus.none,
    this.title = const TitleInput.pure(),
    this.description = const DescriptionInput.pure(),
  });

  TaskState copyWith({
    List<Task> tasks,
    TaskStatusUI taskStatusUI,
    bool editMode,
    TaskDeleteStatus deleteStatus,
    Task loadedTask,
    FormzStatus formStatus,
    String generalNotificationKey,
    TitleInput title,
    DescriptionInput description,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      taskStatusUI: taskStatusUI ?? this.taskStatusUI,
      loadedTask: loadedTask ?? this.loadedTask,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props => [tasks, taskStatusUI,
     loadedTask, editMode, deleteStatus, formStatus, generalNotificationKey, 
title,description,];

  @override
  bool get stringify => true;
}
