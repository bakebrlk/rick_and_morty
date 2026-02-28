import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/domain/entities/location_entity.dart';

class PersonEntity extends Equatable {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationEntity origin;
  LocationEntity location;
  String image;
  List<String> episode;
  DateTime created;

  PersonEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.created,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    type,
    gender,
    origin,
    location,
    image,
    episode,
    created,
  ];
}
