import 'package:auvnet_store/features/profile/presentation/widgets/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: const SingleChildScrollView(
        child: const Column(
          children: [
            //User Profile Info
            UserProfileInfo(),
          ],
        ),
      ),
    );
  }
}