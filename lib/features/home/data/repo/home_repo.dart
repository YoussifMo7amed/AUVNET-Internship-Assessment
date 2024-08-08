import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/home/data/models/banners_response.dart';

class HomeRepo {
  HomeRepo(this._apiService);

  final ApiService _apiService;

  // Get Banners // Get Banners
  Future<ApiResult<List<BannersResponse>>> getBanners() async {
    try {
      final response = await _apiService.banners(); // This should return List<BannersResponse>
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
