import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_state.dart';
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
          children: [
            //User Profile Info
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {

                  if (state is LoadingState) {
                    return const UserProfileShimmer();
                  } else if (state is SuccessState) {
                 return   UserProfileInfo(
                      response: state.response,
                    );
                  }else if (state is ErrorState) {
                    return Text(state.error);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
