import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/enums/nav_bar_enum.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/images/app_images.dart';
import 'package:auvnet_store/features/main/presentation/cubit/cubit/main_cubit.dart';
import 'package:auvnet_store/features/main/presentation/widgets/icon_tap_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Icons
              Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 88.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Home Screen
                                  IconTapNavBar(
                                    icon: AppImages.homeTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.home,
                                    onTap: () {
                                      cubit
                                          .selectedNavBarIcons(NavBarEnum.home);
                                    },
                                  ),
                                 
                                  //Cart Screen
                                  IconTapNavBar(
                                    icon: AppImages.carShop,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.cart,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.cart,
                                      );
                                    },
                                  ),
                                  //Profile Screen
                                  IconTapNavBar(
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.profile,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.profile,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // BackGround Icon
              Positioned(
                top: -12,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.bigNavBar!),
                    ),
                  ),
                ),
              ),
              //Car Icon
              Positioned(
                left: 35,
                top: 17,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
