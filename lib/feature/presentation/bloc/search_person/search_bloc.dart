import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart'
    hide SearchPerson;
import 'package:rick_and_morty/feature/presentation/bloc/search_person/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_person/search_state.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonEmpty());

  @override
  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is SearchPerson) {
      yield* _mapFetchPersonsToState(event.query);
    }
  }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson = await searchPerson.call(
      SearchPersonParams(query: personQuery) as int,
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
