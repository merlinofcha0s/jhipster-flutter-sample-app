import 'package:jhipsterFlutterSampleApp/entities/task/task_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class TaskRepository {
    TaskRepository();
  
  static final String uriEndpoint = '/tasks';

  Future<List<Task>> getAllTasks() async {
    final allTasksRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Task>>(allTasksRequest.body);
  }

  Future<Task> getTask(int id) async {
    final taskRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Task>(taskRequest.body);
  }

  Future<Task> create(Task task) async {
    final taskRequest = await HttpUtils.postRequest('$uriEndpoint', task);
    return JsonMapper.deserialize<Task>(taskRequest.body);
  }

  Future<Task> update(Task task) async {
    final taskRequest = await HttpUtils.putRequest('$uriEndpoint', task);
    return JsonMapper.deserialize<Task>(taskRequest.body);
  }

  Future<void> delete(int id) async {
    final taskRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
