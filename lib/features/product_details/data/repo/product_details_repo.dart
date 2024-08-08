
import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/product_details/data/models/product_response.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._apiService);

  final ApiService _apiService;

  // Get Banners
  Future<ApiResult<ProductDetailsResponse>> productDetails(
      {required int id}) async {
    try {
      final response = await _apiService.productDetails(id);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}