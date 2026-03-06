import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  @override
  List<Object?> get props => [];
}

class ServerExeption implements Exception{}

class CacheException implements Exception{}