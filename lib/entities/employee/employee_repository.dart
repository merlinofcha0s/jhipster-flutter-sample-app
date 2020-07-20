import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class EmployeeRepository {
  EmployeeRepository();

  static final String uriEndpoint = '/employees';

  Future<List<Employee>> getAllEmployees() async {
    final allEmployeesRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Employee>>(allEmployeesRequest.body);
  }

  Future<Employee> getEmployee(int id) async {
    final allEmployeesRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Employee>(allEmployeesRequest.body);
  }
}
