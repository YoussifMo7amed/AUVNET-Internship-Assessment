import 'package:auvnet_store/core/service/networking/api_constants.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/login_response.dart';
import 'package:auvnet_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/signup_response.dart';
import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:auvnet_store/features/home/data/models/categories_response.dart';
import 'package:auvnet_store/features/product_details/data/models/product_response.dart';
import 'package:auvnet_store/features/product_details/presentation/refactors/product_details_body.dart';
import 'package:auvnet_store/features/profile/data/models/profile_responce.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Apiconstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(Apiconstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody body,
  );

  @POST(Apiconstants.signup)
  Future<SignupResponse> signUp(
    @Body() SignupRequestBody body,
  );

  @GET(Apiconstants.profile)
  Future<ProfileResponse> profile();

  @GET(Apiconstants.banners)
  Future<List<ProductResponse>> products();

  @GET(Apiconstants.category)
  Future<List<CategoryResponse>> categories();

    @GET("${Apiconstants.product}{id}")
  Future<ProductDetailsResponse> productDetails(@Path("id") int productId);
}
