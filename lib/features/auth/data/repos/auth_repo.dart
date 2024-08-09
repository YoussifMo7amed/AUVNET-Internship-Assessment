import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/login_response.dart';
import 'package:auvnet_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/signup_response.dart';

class AuthRepos {
  // Constructor that accepts an ApiService object for making network requests
  const AuthRepos(this._apiService);

  // Private instance of ApiService used for making API calls
  final ApiService _apiService;

  // Method for user login
  // Takes LoginRequestBody as a parameter
  // Returns ApiResult<LoginResponse>, which contains either the successful login response or an error message
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      // Make a login request via the API service
      final response = await _apiService.login(body);
      return ApiResult.success(response); // Return success result if the request succeeds
    } catch (error) {
      return const ApiResult.failure(errorMessage); // Return failure result if there's an error
    }
  }

  // Method for user sign-up
  // Takes SignupRequestBody as a parameter
  // Returns ApiResult<SignupResponse>, which contains either the successful signup response or an error message
  Future<ApiResult<SignupResponse>> signUp(SignupRequestBody body) async {
    try {
      // Make a signup request via the API service
      final response = await _apiService.signUp(body);
      return ApiResult.success(response); // Return success result if the request succeeds
    } catch (error) {
      return const ApiResult.failure(errorMessage); // Return failure result if there's an error
    }
  }
}
