import 'package:auvnet_store/core/service/networking/api_result.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:auvnet_store/features/home/data/models/categories_response.dart';

class HomeRepo {
  // Constructor for HomeRepo, takes an instance of ApiService as a dependency.
  HomeRepo(this._apiService);

  final ApiService _apiService;

  // Fetch the list of products from the API.
  Future<ApiResult<List<ProductResponse>>> getProducts() async {
    try {
      // Call the products method from ApiService to get the list of products.
      final response = await _apiService.products();
      
      // Return a successful ApiResult with the fetched product data.
      return ApiResult.success(response);
    } catch (error) {
      // If an error occurs, return a failure ApiResult with the error message.
      return ApiResult.failure(error.toString());
    }
  }

  // Fetch all categories from the API.
  Future<ApiResult<List<CategoryResponse>>> getAllCategories() async {
    try {
      // Call the categories method from ApiService to get the list of categories.
      final response = await _apiService.categories();
      
      // Return a successful ApiResult with the fetched category data.
      return ApiResult.success(response);
    } catch (e) {
      // If an error occurs, return a failure ApiResult with a predefined error message.
      return const ApiResult.failure(errorMessage);
    }
  }
}
