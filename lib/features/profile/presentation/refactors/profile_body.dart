import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_state.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/build_version.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/dark_mode_change.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/logout_widget.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/order_history.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/user_profile_info.dart';
import 'package:auvnet_store/features/profile/presentation/widgets/user_profile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 150,
                  color: context.color.textColor,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            //User Profile Info
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const UserProfileShimmer();
                  } else if (state is SuccessState) {
                    return UserProfileInfo(
                      response: state.response,
                    );
                  } else if (state is ErrorState) {
                    return Text(state.error);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            SizedBox(height: 30.h),
            const CustomFadeInRight(
              duration: 400,
              child: DarkModeChange(),
            ),

            SizedBox(height: 20.h),
            const CustomFadeInRight(
              duration: 400,
              child: OrderHistory(),
            ),
            SizedBox(height: 20.h),
            // Build Version
            const CustomFadeInRight(
              duration: 400,
              child: BuildVersion(),
            ),

            SizedBox(height: 20.h),
            // Logout
            const CustomFadeInRight(
              duration: 400,
              child: LogOutWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
