import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/login_response.dart';

class AuthRepos {
  const AuthRepos(this._apiService);
  final ApiService _apiService;
  //Loign
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);

      return ApiResult.success(response);
    } catch (error) {
      print('errrror====>' + error.toString());
      return  ApiResult.failure(error.toString());
    }
  }
}
