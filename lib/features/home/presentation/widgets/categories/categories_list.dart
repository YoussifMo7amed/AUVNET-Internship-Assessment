import 'package:auvnet_store/features/home/data/models/categories_response.dart';
import 'package:auvnet_store/features/home/presentation/widgets/categories/catgeory_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categoreisList});
final List<CategoryResponse> categoreisList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoreisList.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              image: categoreisList[index].image ,
              title: categoreisList[index].name ,
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
        ),
      ),
    );
  }
}
