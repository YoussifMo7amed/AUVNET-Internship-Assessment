import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  final String name;
  final String email;
  final String password;
  final String avatar;

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
