part of 'job_bloc.dart';

enum JobStatusUI {init, loading, error, done}
enum JobDeleteStatus {ok, ko, none}

class JobState extends Equatable {
  final List<Job> jobs;
  final Job loadedJob;
  final bool editMode;
  final JobDeleteStatus deleteStatus;
  final JobStatusUI jobStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final JobTitleInput jobTitle;
  final MinSalaryInput minSalary;
  final MaxSalaryInput maxSalary;

  
  JobState(
{
    this.jobs = const [],
    this.jobStatusUI = JobStatusUI.init,
    this.loadedJob = const Job(0,'',0,0,null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = JobDeleteStatus.none,
    this.jobTitle = const JobTitleInput.pure(),
    this.minSalary = const MinSalaryInput.pure(),
    this.maxSalary = const MaxSalaryInput.pure(),
  });

  JobState copyWith({
    List<Job> jobs,
    JobStatusUI jobStatusUI,
    bool editMode,
    JobDeleteStatus deleteStatus,
    Job loadedJob,
    FormzStatus formStatus,
    String generalNotificationKey,
    JobTitleInput jobTitle,
    MinSalaryInput minSalary,
    MaxSalaryInput maxSalary,
  }) {
    return JobState(
      jobs: jobs ?? this.jobs,
      jobStatusUI: jobStatusUI ?? this.jobStatusUI,
      loadedJob: loadedJob ?? this.loadedJob,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      jobTitle: jobTitle ?? this.jobTitle,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
    );
  }

  @override
  List<Object> get props => [jobs, jobStatusUI,
     loadedJob, editMode, deleteStatus, formStatus, generalNotificationKey, 
jobTitle,minSalary,maxSalary,];

  @override
  bool get stringify => true;
}
