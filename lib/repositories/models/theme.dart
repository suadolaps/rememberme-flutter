import 'package:equatable/equatable.dart';

class Themes extends Equatable{
  final int id;
  final String name;

 const Themes({this.id, this.name});

 @override
 List<Object> get props => [id, name];

  factory Themes.fromJson(Map<String, dynamic> json) {
    return Themes(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() => 'Theme { name: $name}';
}