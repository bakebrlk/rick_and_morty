import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  const PersonSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchPerson extends PersonSearchEvent{
  final String query;

  const SearchPerson({required this.query});
}