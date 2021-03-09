import 'package:jhipsterFlutterSampleApp/entities/location/location_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class LocationRepository {
    LocationRepository();
  
  static final String uriEndpoint = '/locations';

  Future<List<Location>> getAllLocations() async {
    final allLocationsRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Location>>(allLocationsRequest.body);
  }

  Future<Location> getLocation(int id) async {
    final locationRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Location>(locationRequest.body);
  }

  Future<Location> create(Location location) async {
    final locationRequest = await HttpUtils.postRequest('$uriEndpoint', location);
    return JsonMapper.deserialize<Location>(locationRequest.body);
  }

  Future<Location> update(Location location) async {
    final locationRequest = await HttpUtils.putRequest('$uriEndpoint', location);
    return JsonMapper.deserialize<Location>(locationRequest.body);
  }

  Future<void> delete(int id) async {
    final locationRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
