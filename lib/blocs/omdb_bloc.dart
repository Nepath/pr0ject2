import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pr0ject2/model/search_list_movies.dart';
import 'package:pr0ject2/repositories/omdb_repository.dart';
import 'package:rxdart/rxdart.dart';

class OmdbBloc extends BlocBase{
  OmdbRepository _omdbRepository;

  PublishSubject<String> _searchSubject = PublishSubject();
  Stream<SearchMovies> searchStream;

  OmdbBloc(this._omdbRepository){
    searchStream = _searchSubject
        .debounceTime(Duration(seconds: 1))
        .switchMap((query) => query != ''
         ? _omdbRepository.fetchResults(query).asStream()
        : Stream.fromIterable({SearchMovies(results: [])})
    );
  }

  Function(String title) get fetchResults => _searchSubject.add;

  @override
  void dispose() {
    _searchSubject.close();
    super.dispose();
  }

}