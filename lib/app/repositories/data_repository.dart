import 'package:coronavirus_rest_api_flutter_course/app/repositories/endpoints_data.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api_service.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/data_cache_service.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({@required this.apiService, @required this.dataCacheService});
  final APIService apiService;
  final DataCacheService dataCacheService;

  String _accessToken;

  Future<EndpointData> getEndpointData(Endpoint endpoint,
          {String country}) async =>
      await _getDataRefreshingToken<EndpointData>(
        onGetData: () => apiService.getEndpointData(
          accessToken: _accessToken,
          endpoint: endpoint,
          country: country,
        ),
      );

  EndpointsData getAllEndpointsCachedData({String country}) =>
      country == null ? dataCacheService.getData() : null;

  Future<EndpointsData> getAllEndpointsData({String country}) async {
    final endpointsData = await _getDataRefreshingToken<EndpointsData>(
      onGetData: () => _getAllEndpointsData(country: country),
    );
    if (country == null) {
      // save global data to cache
      await dataCacheService.setData(endpointsData);
    }
    return endpointsData;
  }

  Future<T> _getDataRefreshingToken<T>({Future<T> Function() onGetData}) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await onGetData();
    } on Response catch (response) {
      // if unauthorized, get access token again
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await onGetData();
      }
      rethrow;
    }
  }

  Future<EndpointsData> _getAllEndpointsData({String country}) async {
    final values = await Future.wait([
      apiService.getEndpointData(
        accessToken: _accessToken,
        endpoint: Endpoint.cases,
        country: country,
      ),
      apiService.getEndpointData(
        accessToken: _accessToken,
        endpoint: Endpoint.casesSuspected,
        country: country,
      ),
      apiService.getEndpointData(
        accessToken: _accessToken,
        endpoint: Endpoint.casesConfirmed,
        country: country,
      ),
      apiService.getEndpointData(
        accessToken: _accessToken,
        endpoint: Endpoint.deaths,
        country: country,
      ),
      apiService.getEndpointData(
        accessToken: _accessToken,
        endpoint: Endpoint.recovered,
        country: country,
      ),
    ]);
    return EndpointsData(
      values: {
        Endpoint.cases: values[0],
        Endpoint.casesSuspected: values[1],
        Endpoint.casesConfirmed: values[2],
        Endpoint.deaths: values[3],
        Endpoint.recovered: values[4],
      },
    );
  }
}
