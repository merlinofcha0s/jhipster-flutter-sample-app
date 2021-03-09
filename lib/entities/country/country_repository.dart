import 'package:jhipsterFlutterSampleApp/entities/country/country_model.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

class CountryRepository {
    CountryRepository();
  
  static final String uriEndpoint = '/countries';

  Future<List<Country>> getAllCountries() async {
    final allCountriesRequest = await HttpUtils.getRequest(uriEndpoint);
    return JsonMapper.deserialize<List<Country>>(allCountriesRequest.body);
  }

  Future<Country> getCountry(int id) async {
    final countryRequest = await HttpUtils.getRequest('$uriEndpoint/$id');
    return JsonMapper.deserialize<Country>(countryRequest.body);
  }

  Future<Country> create(Country country) async {
    final countryRequest = await HttpUtils.postRequest('$uriEndpoint', country);
    return JsonMapper.deserialize<Country>(countryRequest.body);
  }

  Future<Country> update(Country country) async {
    final countryRequest = await HttpUtils.putRequest('$uriEndpoint', country);
    return JsonMapper.deserialize<Country>(countryRequest.body);
  }

  Future<void> delete(int id) async {
    final countryRequest = await HttpUtils.deleteRequest('$uriEndpoint/$id');
  }
}
