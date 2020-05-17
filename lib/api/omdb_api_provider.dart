import 'package:pr0ject2/model/MovieT.dart';
import 'package:pr0ject2/model/search_list_movies.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'omdb_api_provider.g.dart';

@RestApi(baseUrl: 'http://www.omdbapi.com/')
abstract class OmdbMoviesProvider{

  factory OmdbMoviesProvider(Dio dio, {String baseUrl}) = _OmdbMoviesProvider;

  @GET("http://www.omdbapi.com/")
  Future<SearchMovies> getMovieList(@Query("s") String text, {@Query ("apikey") String apiKey = "a7a8d1d6"});

  @GET("http://www.omdbapi.com/")
  Future<MovieT> getCurrentMovie(@Query("i") String text, {@Query ("apikey") String apiKey = "a7a8d1d6"});
}