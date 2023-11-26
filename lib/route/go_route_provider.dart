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
          builder: (context, state) => LoginScreen(key: state.pageKey,),
          routes: [
            GoRoute(
              parentNavigatorKey: rootNavKey,
              path: 'findPassword',
              name: findPassword,
              builder: (context, state) => FindPasswordScreen(key: state.pageKey,),
            ),
          ]
        ),
        GoRoute(
          path: '/registerFirstStep',
          name: registerFirstStep,
          builder: (context, state) => RegisterFirstStepScreen(key: state.pageKey,),
          routes: [
            GoRoute(
              path: 'registerSecondStep',
              name: registerSecondStep,
              builder: (context, state) => RegisterSecondStepScreen(key: state.pageKey,),
              routes: [
                GoRoute(
                  path: 'registerThirdStep',
                  name: registerThirdStep,
                  builder: (context, state) => RegisterThirdStepScreen(key: state.pageKey,),
                ),
              ]
            ),
          ]
        ),
        ShellRoute(
            navigatorKey: shellNavKey,
            builder: (context, state, child) {
              return MainScreen(child: child);
            },
            routes: <RouteBase> [
              GoRoute(
                  path: '/home',
                  name: home,
                  builder: (context, state) => HomeScreen(key: state.pageKey,),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavKey,
                      path: 'fatigueCheck',
                      name: fatigueCheck,
                      builder: (context, state) => FatigueCheckScreen(key: state.pageKey,),
                    ),
                  ],
              ),
              GoRoute(
                  path: '/analysis',
                  name: analysis,
                  builder: (context, state) => AnalysisScreen(key: state.pageKey,)
              ),
              GoRoute(
                  path: '/my',
                  name: my,
                  builder: (context, state) => MyScreen(key: state.pageKey,)
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