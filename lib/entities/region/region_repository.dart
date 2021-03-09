import 'package:jhipsterFlutterSampleApp/entities/region/region_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class RegionRepository {
    RegionRepository();
  
  static final String uriEndpoint = '/regions';

  Future<List<Region>> getAllRegions() async {
    final allRegionsRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Region>>(allRegionsRequest.body);
  }

  Future<Region> getRegion(int id) async {
    final regionRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Region>(regionRequest.body);
  }

  Future<Region> create(Region region) async {
    final regionRequest = await HttpUtils.postRequest('$uriEndpoint', region);
    return JsonMapper.deserialize<Region>(regionRequest.body);
  }

  Future<Region> update(Region region) async {
    final regionRequest = await HttpUtils.putRequest('$uriEndpoint', region);
    return JsonMapper.deserialize<Region>(regionRequest.body);
  }

  Future<void> delete(int id) async {
    final regionRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
