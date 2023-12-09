import 'package:amitamin/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amitamin/pages/my/my.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingScreen extends ConsumerStatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileSettingScreen> createState() => ProfileSettingScreenState();
}

class ProfileSettingScreenState extends ConsumerState<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultMainLayout(
      backgroundColor: CustomColor.extraLightGray,
      appBar: DefaultAppBar(
        title: '프로필 설정',
        leadingDisable: false,
        leadingOnPressed: () {
          context.pop();
        },
        actionDisable: true,
      ),
      child: WillPopScope(
        onWillPop: () async {
          context.pop();
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySubMenuContainer(
                  menuName: "닉네임",
                  svgPath: "",
                  svgFlag: false,
                  widget: Row(
                    children: [
                      Text(
                        "문동은",
                        style: TextStyle(
                            color: CustomColor.darkGray,
                            fontSize: CustomText.body3.fontSize,
                            fontFamily: CustomText.body3.fontFamily,
                            fontWeight: CustomText.body3.fontWeight
                        ),
                      ),
                      const SizedBox(width: 2,),
                      SvgPicture.asset(
                        "assets/icons/gray_arrow_next.svg",
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  voidCallback: () {},
                ),
                const SizedBox(height: 1,),
                MySubMenuContainer(
                  menuName: "성별",
                  svgPath: "",
                  svgFlag: false,
                  widget: Row(
                    children: [
                      Text(
                        "여성",
                        style: TextStyle(
                            color: CustomColor.darkGray,
                            fontSize: CustomText.body3.fontSize,
                            fontFamily: CustomText.body3.fontFamily,
                            fontWeight: CustomText.body3.fontWeight
                        ),
                      ),
                      const SizedBox(width: 2,),
                      SvgPicture.asset(
                        "assets/icons/gray_arrow_next.svg",
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  voidCallback: () {},
                ),
                const SizedBox(height: 1,),
                MySubMenuContainer(
                  menuName: "나이",
                  svgPath: "",
                  svgFlag: false,
                  widget: Row(
                    children: [
                      Text(
                        "만 42세",
                        style: TextStyle(
                            color: CustomColor.darkGray,
                            fontSize: CustomText.body3.fontSize,
                            fontFamily: CustomText.body3.fontFamily,
                            fontWeight: CustomText.body3.fontWeight
                        ),
                      ),
                      const SizedBox(width: 2,),
                      SvgPicture.asset(
                        "assets/icons/gray_arrow_next.svg",
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  voidCallback: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}