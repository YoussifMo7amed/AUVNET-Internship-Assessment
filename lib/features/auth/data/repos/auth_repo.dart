import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/login_response.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final ApiService _dataSource;
  //Loign
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
