import 'package:amitamin/pages/login/view/find_password_screen.dart';
import 'package:amitamin/route/named_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amitamin/pages/home/home.dart';
import 'package:amitamin/pages/analysis/analysis.dart';
import 'package:amitamin/pages/my/my.dart';
import 'package:amitamin/pages/main/main.dart';
import 'package:amitamin/pages/error/error.dart';
import 'package:amitamin/pages/login/login.dart';
import 'package:amitamin/pages/register/register.dart';

final goRouterProvider = Provider<GoRouter>((ref) => goRouteList());

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

GoRouter goRouteList() {
  return GoRouter(
      navigatorKey: rootNavKey,
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: login,
          pageBuilder: (context, state) => NoTransitionPage(
            child: LoginScreen(key: state.pageKey,),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: rootNavKey,
              path: 'findPassword',
              name: findPassword,
              pageBuilder: (context, state) => NoTransitionPage(
                child: FindPasswordScreen(key: state.pageKey,),
              ),
            ),
          ]
        ),
        GoRoute(
          path: '/registerFirstStep',
          name: registerFirstStep,
          pageBuilder: (context, state) => NoTransitionPage(
            child: RegisterFirstStepScreen(key: state.pageKey,),
          ),
          routes: [
            GoRoute(
              path: 'registerSecondStep',
              name: registerSecondStep,
              pageBuilder: (context, state) => NoTransitionPage(
                child: RegisterSecondStepScreen(key: state.pageKey,),
              ),
              routes: [
                GoRoute(
                  path: 'registerThirdStep',
                  name: registerThirdStep,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: RegisterThirdStepScreen(key: state.pageKey,),
                  ),
                ),
              ]
            ),
          ]
        ),
        ShellRoute(
            navigatorKey: shellNavKey,
            // builder: (context, state, child) {
            //   return MainScreen(child: child);
            // },
            pageBuilder: (context, state, child) {
              return NoTransitionPage(
                child: MainScreen(child: child,),
              );
            },
            routes: <RouteBase> [
              GoRoute(
                  path: '/home',
                  name: home,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: HomeScreen(key: state.pageKey,),
                  ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavKey,
                      path: 'fatigueCheck',
                      name: fatigueCheck,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: FatigueCheckScreen(key: state.pageKey,),
                      ),
                    ),
                  ],
              ),
              GoRoute(
                path: '/analysis',
                name: analysis,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AnalysisScreen(key: state.pageKey,),
                ),
              ),
              GoRoute(
                path: '/my',
                name: my,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: MyScreen(key: state.pageKey,),
                ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavKey,
                    path: 'profileSetting',
                    name: profileSetting,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ProfileSettingScreen(key: state.pageKey,),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ],
      errorBuilder: (context, state) => RouteErrorScreen(
        errorMsg: state.error.toString(),
        key: state.pageKey,
      )
  );
}