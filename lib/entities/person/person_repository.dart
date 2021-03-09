import 'package:jhipsterFlutterSampleApp/entities/person/person_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class PersonRepository {
    PersonRepository();
  
  static final String uriEndpoint = '/people';

  Future<List<Person>> getAllPeople() async {
    final allPeopleRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Person>>(allPeopleRequest.body);
  }

  Future<Person> getPerson(int id) async {
    final personRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Person>(personRequest.body);
  }

  Future<Person> create(Person person) async {
    final personRequest = await HttpUtils.postRequest('$uriEndpoint', person);
    return JsonMapper.deserialize<Person>(personRequest.body);
  }

  Future<Person> update(Person person) async {
    final personRequest = await HttpUtils.putRequest('$uriEndpoint', person);
    return JsonMapper.deserialize<Person>(personRequest.body);
  }

  Future<void> delete(int id) async {
    final personRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
