import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:auvnet_store/core/common/widgets/custom_product_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
 const ProductsList({
    required this.productList,
    super.key,
  });

  final List<ProductResponse> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Number of cloums
          crossAxisSpacing: 8, // Spacing between colums
          mainAxisSpacing: 15, //Spacing between rows
          childAspectRatio: 165 / 250,
        ),
        itemBuilder: (context, index) {
          return  CustomProductItem(
              price: productList[index].price ?? 0,
            categoryName: productList[index].category!.name ?? '',
            title: productList[index].title ?? '',
            imageUrl: productList[index].images!.first,
         productId: productList[index].id ?? 0,             
          );
        },
      ),
    );
  }
}
