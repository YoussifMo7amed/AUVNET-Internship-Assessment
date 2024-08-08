import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/profile/data/models/profile_responce.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  const ProfileRepo(this._apiService);

  final ApiService _apiService;

  // Get User Profile
  Future<ApiResult<ProfileResponse>> getUserProfile(String token) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _apiService.profile();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
