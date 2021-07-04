import 'package:equatable/equatable.dart';

class CastData extends Equatable{
  final String? name;
  final String? profilePath;
  final String? character;
  CastData({
    required this.name,
    required this.profilePath,
    required this.character});

  factory CastData.fromJson(Map<String, dynamic> json) {
    return CastData(
        name: json['name'],
        profilePath:json['profile_path'].toString(),
        character: json['character']
    );

  }

  @override
  List<Object?> get props => [name,profilePath,character];
}