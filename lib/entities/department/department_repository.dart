import 'package:jhipsterFlutterSampleApp/entities/department/department_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class DepartmentRepository {
    DepartmentRepository();
  
  static final String uriEndpoint = '/departments';

  Future<List<Department>> getAllDepartments() async {
    final allDepartmentsRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Department>>(allDepartmentsRequest.body);
  }

  Future<Department> getDepartment(int id) async {
    final departmentRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Department>(departmentRequest.body);
  }

  Future<Department> create(Department department) async {
    final departmentRequest = await HttpUtils.postRequest('$uriEndpoint', department);
    return JsonMapper.deserialize<Department>(departmentRequest.body);
  }

  Future<Department> update(Department department) async {
    final departmentRequest = await HttpUtils.putRequest('$uriEndpoint', department);
    return JsonMapper.deserialize<Department>(departmentRequest.body);
  }

  Future<void> delete(int id) async {
    final departmentRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
