import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/login_response.dart';
import 'package:auvnet_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/signup_response.dart';

class AuthRepos {
  const AuthRepos(this._apiService);
  final ApiService _apiService;
  //Loign
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }

  //SignUp
  Future<ApiResult<SignupResponse>> signUp(SignupRequestBody body) async {
    try {
      final response = await _apiService.signUp(body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
