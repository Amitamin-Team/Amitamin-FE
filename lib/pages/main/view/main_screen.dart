import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amitamin/common/common.dart';
import 'package:amitamin/pages/home/home.dart';
import './main_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    final bottomIndex = ref.watch(bottomIndexProvider);

    final List<PreferredSizeWidget?> appbar = [
      // TODO: 알림을 여기서 받아 뿌려줄지, 아니면 HomeScreenAppBar 자체에서 처리할지 결정해야 함
      const HomeScreenAppBar(
        alarmExist: false,
      ),
      AppBar(),
      null
    ];

    void changeTabScreen() {
      switch(ref.watch(bottomIndexProvider)) {
        case 0:
          return context.go('/home');
        case 1:
          return context.go('/analysis');
        case 2:
          return context.go('/my');
      }
    }

    void onPressBackButton() {
      if(Platform.isAndroid) {
        if(ref.watch(bottomIndexProvider) != 0) {
          ref.watch(bottomIndexProvider.notifier).setIndex(0);
          changeTabScreen();
          return;
        }

        onWillPopClose();
      }
    }

    return DefaultMainLayout(
      appBar: appbar[bottomIndex],
      bottomNavigationBar: MainBottomNavigationBar(
        ref: ref,
        index: bottomIndex,
        onTap: () {
          changeTabScreen();
        },
      ),
      child: WillPopScope(
        onWillPop: () async {
          onPressBackButton();
          return false;
        },
        child: widget.child,
      ),
    );
  }
}





