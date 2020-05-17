// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OmdbMoviesProvider implements OmdbMoviesProvider {
  _OmdbMoviesProvider(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://www.omdbapi.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getMovieList(text, {apiKey = "a7a8d1d6"}) async {
    ArgumentError.checkNotNull(text, 'text');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': text, r'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchMovies.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getCurrentMovie(text, {apiKey = "a7a8d1d6"}) async {
    ArgumentError.checkNotNull(text, 'text');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r't': text, r'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Movie.fromJson(_result.data);
    return Future.value(value);
  }
}
