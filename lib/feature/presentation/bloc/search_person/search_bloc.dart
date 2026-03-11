import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_person/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_person/search_state.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPersons searchPersons;

  PersonSearchBloc({required this.searchPersons}) : super(PersonEmpty());

  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is SearchPerson) {
      yield* _mapFetchPersonsToState(event.query);
    }
  }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson = await searchPersons(
      SearchPersonParams(query: personQuery),
    );
    yield failureOrPerson.fold(
      (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
      (person) => PersonSearchLoaded(person),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'Server Failure';
      case CacheFailure _:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
