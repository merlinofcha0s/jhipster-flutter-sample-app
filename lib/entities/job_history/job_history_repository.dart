import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class JobHistoryRepository {
    JobHistoryRepository();
  
  static final String uriEndpoint = '/job-histories';

  Future<List<JobHistory>> getAllJobHistories() async {
    final allJobHistoriesRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<JobHistory>>(allJobHistoriesRequest.body);
  }

  Future<JobHistory> getJobHistory(int id) async {
    final jobHistoryRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<JobHistory>(jobHistoryRequest.body);
  }

  Future<JobHistory> create(JobHistory jobHistory) async {
    final jobHistoryRequest = await HttpUtils.postRequest('$uriEndpoint', jobHistory);
    return JsonMapper.deserialize<JobHistory>(jobHistoryRequest.body);
  }

  Future<JobHistory> update(JobHistory jobHistory) async {
    final jobHistoryRequest = await HttpUtils.putRequest('$uriEndpoint', jobHistory);
    return JsonMapper.deserialize<JobHistory>(jobHistoryRequest.body);
  }

  Future<void> delete(int id) async {
    final jobHistoryRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
