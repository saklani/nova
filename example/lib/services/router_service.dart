import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/screen/onboard/onboard.dart';
import 'package:wallet/screen/return/return.dart';
import 'package:wallet/services/auth_notifier.dart';

import '../enums/auth_state.dart';
import '../screen/home.dart';
import '../screen/sign_in.dart';
import 'auth_notifier.dart';

final routerServiceProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (_, __) => const Home()),
      GoRoute(path: '/sign-in', builder: (_, __) => const SignIn()),
      GoRoute(path: '/onboard', builder: (_, __) => const Onboard()),
      GoRoute(path: '/return', builder: (_, __) => const Return()),
    ],
    debugLogDiagnostics: true,
    redirect: (GoRouterState state) {
      final authState = ref.read(authStateNotifier);
      switch (authState) {
        case AuthState.SIGNED_OUT:
          return state.location == "/" ? "/sign-in" : null;
        default:
          return null;
      }
    },
    refreshListenable: RouterNotifier(ref),
  ),
);

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(authStateNotifier, (_, __) => notifyListeners());
  }
}
