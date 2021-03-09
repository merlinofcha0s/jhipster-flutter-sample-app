import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/task/task_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/task_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/bloc/task_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'task_events.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  TaskBloc({@required TaskRepository taskRepository}) : assert(taskRepository != null),
        _taskRepository = taskRepository, 
  super(TaskState());

  @override
  void onTransition(Transition<TaskEvent, TaskState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is InitTaskList) {
      yield* onInitList(event);
    } else if (event is TaskFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadTaskByIdForEdit) {
      yield* onLoadTaskIdForEdit(event);
    } else if (event is DeleteTaskById) {
      yield* onDeleteTaskId(event);
    } else if (event is LoadTaskByIdForView) {
      yield* onLoadTaskIdForView(event);
    }else if (event is TitleChanged){
      yield* onTitleChange(event);
    }else if (event is DescriptionChanged){
      yield* onDescriptionChange(event);
    }  }

  Stream<TaskState> onInitList(InitTaskList event) async* {
    yield this.state.copyWith(taskStatusUI: TaskStatusUI.loading);
    List<Task> tasks = await _taskRepository.getAllTasks();
    yield this.state.copyWith(tasks: tasks, taskStatusUI: TaskStatusUI.done);
  }

  Stream<TaskState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Task result;
        if(this.state.editMode) {
          Task newTask = Task(state.loadedTask.id,
            this.state.title.value,  
            this.state.description.value,  
          );

          result = await _taskRepository.update(newTask);
        } else {
          Task newTask = Task(null,
            this.state.title.value,  
            this.state.description.value,  
          );

          result = await _taskRepository.create(newTask);
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

  Stream<TaskState> onLoadTaskIdForEdit(LoadTaskByIdForEdit event) async* {
    yield this.state.copyWith(taskStatusUI: TaskStatusUI.loading);
    Task loadedTask = await _taskRepository.getTask(event.id);

    final title = TitleInput.dirty(loadedTask?.title != null ? loadedTask.title: '');
    final description = DescriptionInput.dirty(loadedTask?.description != null ? loadedTask.description: '');

    yield this.state.copyWith(loadedTask: loadedTask, editMode: true,
      title: title,
      description: description,
    taskStatusUI: TaskStatusUI.done);

    titleController.text = loadedTask.title;
    descriptionController.text = loadedTask.description;
  }

  Stream<TaskState> onDeleteTaskId(DeleteTaskById event) async* {
    try {
      await _taskRepository.delete(event.id);
      this.add(InitTaskList());
      yield this.state.copyWith(deleteStatus: TaskDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: TaskDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: TaskDeleteStatus.none);
  }

  Stream<TaskState> onLoadTaskIdForView(LoadTaskByIdForView event) async* {
    yield this.state.copyWith(taskStatusUI: TaskStatusUI.loading);
    try {
      Task loadedTask = await _taskRepository.getTask(event.id);
      yield this.state.copyWith(loadedTask: loadedTask, taskStatusUI: TaskStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedTask: null, taskStatusUI: TaskStatusUI.error);
    }
  }


  Stream<TaskState> onTitleChange(TitleChanged event) async* {
    final title = TitleInput.dirty(event.title);
    yield this.state.copyWith(
      title: title,
      formStatus: Formz.validate([
        title,
      this.state.description,
      ]),
    );
  }
  Stream<TaskState> onDescriptionChange(DescriptionChanged event) async* {
    final description = DescriptionInput.dirty(event.description);
    yield this.state.copyWith(
      description: description,
      formStatus: Formz.validate([
      this.state.title,
        description,
      ]),
    );
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }

}