import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class JobRepository {
    JobRepository();
  
  static final String uriEndpoint = '/jobs';

  Future<List<Job>> getAllJobs() async {
    final allJobsRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Job>>(allJobsRequest.body);
  }

  Future<Job> getJob(int id) async {
    final jobRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Job>(jobRequest.body);
  }

  Future<Job> create(Job job) async {
    final jobRequest = await HttpUtils.postRequest('$uriEndpoint', job);
    return JsonMapper.deserialize<Job>(jobRequest.body);
  }

  Future<Job> update(Job job) async {
    final jobRequest = await HttpUtils.putRequest('$uriEndpoint', job);
    return JsonMapper.deserialize<Job>(jobRequest.body);
  }

  Future<void> delete(int id) async {
    final jobRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
