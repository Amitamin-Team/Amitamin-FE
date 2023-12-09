import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amitamin/common/common.dart';
import 'package:intl/intl.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    Key? key,
    this.today,
    required this.alarmExist,
  }) : super(key: key);

  final String? today;
  final bool alarmExist;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(51.0),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: CustomColor.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            today ?? DateFormat('M월 d일 (E)','ko_KR').format(DateTime.now()),
            style: TextStyle(
              color: CustomColor.primaryBlue100,
              fontSize: CustomText.headLine7.fontSize,
              fontWeight: CustomText.headLine7.fontWeight,
              fontFamily: CustomText.headLine7.fontFamily,
            ),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        actions: [
          alarmExist
              ? IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home/alarm_exist.svg',
              width: 24,
              height: 24,
            ),
          )
              : IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/home/alarm_empty.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(51.0);
}