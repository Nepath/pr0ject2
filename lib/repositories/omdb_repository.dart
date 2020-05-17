import 'package:pr0ject2/api/omdb_api_provider.dart';
import 'package:pr0ject2/model/MovieT.dart';
import 'package:pr0ject2/model/search_list_movies.dart';

class OmdbRepository{
  OmdbMoviesProvider _omdbMoviesProvider;

  OmdbRepository(this._omdbMoviesProvider);

  Future<SearchMovies> fetchResults(String title)  => _omdbMoviesProvider.getMovieList(title);

  Future<MovieT> getTitle(String id) => _omdbMoviesProvider.getCurrentMovie(id);
}