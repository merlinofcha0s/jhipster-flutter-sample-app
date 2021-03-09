part of 'job_history_bloc.dart';

enum JobHistoryStatusUI {init, loading, error, done}
enum JobHistoryDeleteStatus {ok, ko, none}

class JobHistoryState extends Equatable {
  final List<JobHistory> jobHistories;
  final JobHistory loadedJobHistory;
  final bool editMode;
  final JobHistoryDeleteStatus deleteStatus;
  final JobHistoryStatusUI jobHistoryStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final StartDateInput startDate;
  final EndDateInput endDate;
  final LanguageInput language;

  
  JobHistoryState(
StartDateInput startDate,EndDateInput endDate,{
    this.jobHistories = const [],
    this.jobHistoryStatusUI = JobHistoryStatusUI.init,
    this.loadedJobHistory = const JobHistory(0,null,null,null,null,null,null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = JobHistoryDeleteStatus.none,
    this.language = const LanguageInput.pure(),
  }):this.startDate = startDate ?? StartDateInput.pure(),
this.endDate = endDate ?? EndDateInput.pure()
;

  JobHistoryState copyWith({
    List<JobHistory> jobHistories,
    JobHistoryStatusUI jobHistoryStatusUI,
    bool editMode,
    JobHistoryDeleteStatus deleteStatus,
    JobHistory loadedJobHistory,
    FormzStatus formStatus,
    String generalNotificationKey,
    StartDateInput startDate,
    EndDateInput endDate,
    LanguageInput language,
  }) {
    return JobHistoryState(
        startDate,
        endDate,
      jobHistories: jobHistories ?? this.jobHistories,
      jobHistoryStatusUI: jobHistoryStatusUI ?? this.jobHistoryStatusUI,
      loadedJobHistory: loadedJobHistory ?? this.loadedJobHistory,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [jobHistories, jobHistoryStatusUI,
     loadedJobHistory, editMode, deleteStatus, formStatus, generalNotificationKey, 
startDate,endDate,language,];

  @override
  bool get stringify => true;
}
