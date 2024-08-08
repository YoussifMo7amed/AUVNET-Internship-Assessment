import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:auvnet_store/features/home/data/models/categories_response.dart';

class HomeRepo {
  HomeRepo(this._apiService);

  final ApiService _apiService;

  // Get Banners // Get Banners
  Future<ApiResult<List<ProductResponse>>> getProducts() async {
    try {
      final response = await _apiService
          .products(); // This should return List<BannersResponse>
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  // Get All Categories
  Future<ApiResult<List<CategoryResponse>>> getAllCategories() async {
    try {
      final response = await _apiService.categories();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
