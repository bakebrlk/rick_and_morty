import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}

class CacheFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}
