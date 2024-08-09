import 'package:auvnet_store/core/common/widgets/custom_app_bar.dart';
import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/extensions/string_exetension.dart';
import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_event.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_state.dart';
import 'package:auvnet_store/features/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:auvnet_store/features/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:auvnet_store/features/product_details/presentation/refactors/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()
        ..add(
          GetProductDetailsEvent(productId: productId),
        ),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.color.textColor,
                ),
              ),
            );
          } else if (state is ProductDetailsSuccessState) {
            return Scaffold(
              appBar: CustomAppBar(
                title: state.productDetailsResponse.title.convertLongString(),
              ),
              bottomNavigationBar: AddToCartButton(
                  price: double.parse(
                      state.productDetailsResponse.price.toString()),
                  productDetailsResponse: state.productDetailsResponse),
              body: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height,
                    ),
                    painter: DetailsCustomPainter(
                      gradient: LinearGradient(
                        colors: [
                          context.color.bluePinkLight!,
                          context.color.bluePinkDark!,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  ProductDetailsBody(
                    productDetailsResponse: state.productDetailsResponse,
                  ),
                ],
              ),
            );
          } else if (state is ProductDetailsErrorState) {
            return Scaffold(
              body: Center(
                child: Text(state.error),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
