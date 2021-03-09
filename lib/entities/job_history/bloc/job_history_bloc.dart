import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/bloc/job_history_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'job_history_events.dart';
part 'job_history_state.dart';

class JobHistoryBloc extends Bloc<JobHistoryEvent, JobHistoryState> {
  final JobHistoryRepository _jobHistoryRepository;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  JobHistoryBloc({@required JobHistoryRepository jobHistoryRepository}) : assert(jobHistoryRepository != null),
        _jobHistoryRepository = jobHistoryRepository, 
  super(JobHistoryState(null,null,));

  @override
  void onTransition(Transition<JobHistoryEvent, JobHistoryState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<JobHistoryState> mapEventToState(JobHistoryEvent event) async* {
    if (event is InitJobHistoryList) {
      yield* onInitList(event);
    } else if (event is JobHistoryFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadJobHistoryByIdForEdit) {
      yield* onLoadJobHistoryIdForEdit(event);
    } else if (event is DeleteJobHistoryById) {
      yield* onDeleteJobHistoryId(event);
    } else if (event is LoadJobHistoryByIdForView) {
      yield* onLoadJobHistoryIdForView(event);
    }else if (event is StartDateChanged){
      yield* onStartDateChange(event);
    }else if (event is EndDateChanged){
      yield* onEndDateChange(event);
    }else if (event is LanguageChanged){
      yield* onLanguageChange(event);
    }  }

  Stream<JobHistoryState> onInitList(InitJobHistoryList event) async* {
    yield this.state.copyWith(jobHistoryStatusUI: JobHistoryStatusUI.loading);
    List<JobHistory> jobHistories = await _jobHistoryRepository.getAllJobHistories();
    yield this.state.copyWith(jobHistories: jobHistories, jobHistoryStatusUI: JobHistoryStatusUI.done);
  }

  Stream<JobHistoryState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        JobHistory result;
        if(this.state.editMode) {
          JobHistory newJobHistory = JobHistory(state.loadedJobHistory.id,
            this.state.startDate.value,  
            this.state.endDate.value,  
            this.state.language.value,  
            null, 
            null, 
            null, 
          );

          result = await _jobHistoryRepository.update(newJobHistory);
        } else {
          JobHistory newJobHistory = JobHistory(null,
            this.state.startDate.value,  
            this.state.endDate.value,  
            this.state.language.value,  
            null, 
            null, 
            null, 
          );

          result = await _jobHistoryRepository.create(newJobHistory);
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

  Stream<JobHistoryState> onLoadJobHistoryIdForEdit(LoadJobHistoryByIdForEdit event) async* {
    yield this.state.copyWith(jobHistoryStatusUI: JobHistoryStatusUI.loading);
    JobHistory loadedJobHistory = await _jobHistoryRepository.getJobHistory(event.id);

    final startDate = StartDateInput.dirty(loadedJobHistory?.startDate != null ? loadedJobHistory.startDate: null);
    final endDate = EndDateInput.dirty(loadedJobHistory?.endDate != null ? loadedJobHistory.endDate: null);
    final language = LanguageInput.dirty(loadedJobHistory?.language != null ? loadedJobHistory.language: null);

    yield this.state.copyWith(loadedJobHistory: loadedJobHistory, editMode: true,
      startDate: startDate,
      endDate: endDate,
      language: language,
    jobHistoryStatusUI: JobHistoryStatusUI.done);

    startDateController.text = DateFormat.yMMMMd(S.current.locale).format(loadedJobHistory?.startDate);
    endDateController.text = DateFormat.yMMMMd(S.current.locale).format(loadedJobHistory?.endDate);
  }

  Stream<JobHistoryState> onDeleteJobHistoryId(DeleteJobHistoryById event) async* {
    try {
      await _jobHistoryRepository.delete(event.id);
      this.add(InitJobHistoryList());
      yield this.state.copyWith(deleteStatus: JobHistoryDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: JobHistoryDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: JobHistoryDeleteStatus.none);
  }

  Stream<JobHistoryState> onLoadJobHistoryIdForView(LoadJobHistoryByIdForView event) async* {
    yield this.state.copyWith(jobHistoryStatusUI: JobHistoryStatusUI.loading);
    try {
      JobHistory loadedJobHistory = await _jobHistoryRepository.getJobHistory(event.id);
      yield this.state.copyWith(loadedJobHistory: loadedJobHistory, jobHistoryStatusUI: JobHistoryStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedJobHistory: null, jobHistoryStatusUI: JobHistoryStatusUI.error);
    }
  }


  Stream<JobHistoryState> onStartDateChange(StartDateChanged event) async* {
    final startDate = StartDateInput.dirty(event.startDate);
    yield this.state.copyWith(
      startDate: startDate,
      formStatus: Formz.validate([
        startDate,
      this.state.endDate,
      this.state.language,
      ]),
    );
  }
  Stream<JobHistoryState> onEndDateChange(EndDateChanged event) async* {
    final endDate = EndDateInput.dirty(event.endDate);
    yield this.state.copyWith(
      endDate: endDate,
      formStatus: Formz.validate([
      this.state.startDate,
        endDate,
      this.state.language,
      ]),
    );
  }
  Stream<JobHistoryState> onLanguageChange(LanguageChanged event) async* {
    final language = LanguageInput.dirty(event.language);
    yield this.state.copyWith(
      language: language,
      formStatus: Formz.validate([
      this.state.startDate,
      this.state.endDate,
        language,
      ]),
    );
  }

  @override
  Future<void> close() {
    startDateController.dispose();
    endDateController.dispose();
    return super.close();
  }

}