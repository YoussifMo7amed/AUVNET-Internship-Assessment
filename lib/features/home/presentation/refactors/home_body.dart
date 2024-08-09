import 'package:auvnet_store/core/common/loading/empty_page.dart';
import 'package:auvnet_store/core/common/loading/loading_shimmer.dart';
import 'package:auvnet_store/core/common/widgets/custom_button.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_state.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_state.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_state.dart';
import 'package:auvnet_store/features/home/presentation/widgets/banners/banner_sliders.dart';
import 'package:auvnet_store/features/home/presentation/widgets/categories/categories_list.dart';
import 'package:auvnet_store/features/home/presentation/widgets/categories/categories_shimmer.dart';
import 'package:auvnet_store/features/home/presentation/widgets/products/products_list.dart';
import 'package:auvnet_store/features/home/presentation/widgets/products/products_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.scrollCOntroller, super.key});

  final ScrollController scrollCOntroller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetBannersBloc>().add(FetchBannersEvent());
        context.read<GetCategoriesBloc>().add(FetchCategoriesEvent());
        context.read<GetProductsBloc>().add(FetchProductsEvent());
      },
      child: CustomScrollView(
        controller: scrollCOntroller,
        slivers: [
          //Banners

          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: LoadingShimmer(
                      height: 160.h,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                } else if (state is SuccessState) {
                  return BannerSliders(
                    bannersList: state.imageBannerList,
                  );
                } else if (state is ErrorState) {
                  return Text(state.error);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),

          //Caegories

          SliverToBoxAdapter(
            child: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoadingState) {
                  return const CategoriesShimmer();
                } else if (state is CategoriesSuccessState) {
                  return CategoriesList(
                    categoreisList: state.response,
                  );
                } else if (state is CategoriesErrorState) {
                  return Text(state.error);
                } else {
                  return const EmptyPage();
                }
              },
            ),
          ),

          //Products          //Products

          SliverToBoxAdapter(
            child: BlocBuilder<GetProductsBloc, GetProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  return const ProductsShimmer();
                }else if (state is ProductsSuccessState) {
                  return ProductsList(
                    productList: state.productsList,
                  );
                }else if (state is ProductsErrorState) {
                  return Text(state.error);
                }else{
                  return const SizedBox.shrink();
                }


                
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 60.h),
          ),
        ],
      ),
    );
  }
}
