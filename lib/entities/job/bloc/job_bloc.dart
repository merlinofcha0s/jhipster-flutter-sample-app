import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/bloc/job_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'job_events.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository _jobRepository;

  final jobTitleController = TextEditingController();
  final minSalaryController = TextEditingController();
  final maxSalaryController = TextEditingController();

  JobBloc({@required JobRepository jobRepository}) : assert(jobRepository != null),
        _jobRepository = jobRepository, 
  super(JobState());

  @override
  void onTransition(Transition<JobEvent, JobState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<JobState> mapEventToState(JobEvent event) async* {
    if (event is InitJobList) {
      yield* onInitList(event);
    } else if (event is JobFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadJobByIdForEdit) {
      yield* onLoadJobIdForEdit(event);
    } else if (event is DeleteJobById) {
      yield* onDeleteJobId(event);
    } else if (event is LoadJobByIdForView) {
      yield* onLoadJobIdForView(event);
    }else if (event is JobTitleChanged){
      yield* onJobTitleChange(event);
    }else if (event is MinSalaryChanged){
      yield* onMinSalaryChange(event);
    }else if (event is MaxSalaryChanged){
      yield* onMaxSalaryChange(event);
    }  }

  Stream<JobState> onInitList(InitJobList event) async* {
    yield this.state.copyWith(jobStatusUI: JobStatusUI.loading);
    List<Job> jobs = await _jobRepository.getAllJobs();
    yield this.state.copyWith(jobs: jobs, jobStatusUI: JobStatusUI.done);
  }

  Stream<JobState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Job result;
        if(this.state.editMode) {
          Job newJob = Job(state.loadedJob.id,
            this.state.jobTitle.value,  
            this.state.minSalary.value,  
            this.state.maxSalary.value,  
            null, 
          );

          result = await _jobRepository.update(newJob);
        } else {
          Job newJob = Job(null,
            this.state.jobTitle.value,  
            this.state.minSalary.value,  
            this.state.maxSalary.value,  
            null, 
          );

          result = await _jobRepository.create(newJob);
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

  Stream<JobState> onLoadJobIdForEdit(LoadJobByIdForEdit event) async* {
    yield this.state.copyWith(jobStatusUI: JobStatusUI.loading);
    Job loadedJob = await _jobRepository.getJob(event.id);

    final jobTitle = JobTitleInput.dirty(loadedJob?.jobTitle != null ? loadedJob.jobTitle: '');
    final minSalary = MinSalaryInput.dirty(loadedJob?.minSalary != null ? loadedJob.minSalary: 0);
    final maxSalary = MaxSalaryInput.dirty(loadedJob?.maxSalary != null ? loadedJob.maxSalary: 0);

    yield this.state.copyWith(loadedJob: loadedJob, editMode: true,
      jobTitle: jobTitle,
      minSalary: minSalary,
      maxSalary: maxSalary,
    jobStatusUI: JobStatusUI.done);

    jobTitleController.text = loadedJob.jobTitle;
    minSalaryController.text = loadedJob.minSalary.toString();
    maxSalaryController.text = loadedJob.maxSalary.toString();
  }

  Stream<JobState> onDeleteJobId(DeleteJobById event) async* {
    try {
      await _jobRepository.delete(event.id);
      this.add(InitJobList());
      yield this.state.copyWith(deleteStatus: JobDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: JobDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: JobDeleteStatus.none);
  }

  Stream<JobState> onLoadJobIdForView(LoadJobByIdForView event) async* {
    yield this.state.copyWith(jobStatusUI: JobStatusUI.loading);
    try {
      Job loadedJob = await _jobRepository.getJob(event.id);
      yield this.state.copyWith(loadedJob: loadedJob, jobStatusUI: JobStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedJob: null, jobStatusUI: JobStatusUI.error);
    }
  }


  Stream<JobState> onJobTitleChange(JobTitleChanged event) async* {
    final jobTitle = JobTitleInput.dirty(event.jobTitle);
    yield this.state.copyWith(
      jobTitle: jobTitle,
      formStatus: Formz.validate([
        jobTitle,
      this.state.minSalary,
      this.state.maxSalary,
      ]),
    );
  }
  Stream<JobState> onMinSalaryChange(MinSalaryChanged event) async* {
    final minSalary = MinSalaryInput.dirty(event.minSalary);
    yield this.state.copyWith(
      minSalary: minSalary,
      formStatus: Formz.validate([
      this.state.jobTitle,
        minSalary,
      this.state.maxSalary,
      ]),
    );
  }
  Stream<JobState> onMaxSalaryChange(MaxSalaryChanged event) async* {
    final maxSalary = MaxSalaryInput.dirty(event.maxSalary);
    yield this.state.copyWith(
      maxSalary: maxSalary,
      formStatus: Formz.validate([
      this.state.jobTitle,
      this.state.minSalary,
        maxSalary,
      ]),
    );
  }

  @override
  Future<void> close() {
    jobTitleController.dispose();
    minSalaryController.dispose();
    maxSalaryController.dispose();
    return super.close();
  }

}