import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_responce.g.dart';
@JsonSerializable()
class ProfileResponse {
  ProfileResponse(

    this.userId,
    this.userEmail,
    this.userName,

  );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  @JsonKey(name: 'id')
  final int? userId;

  @JsonKey(name: 'name')
  final String? userName;

  @JsonKey(name: 'email')
  final String? userEmail;

}