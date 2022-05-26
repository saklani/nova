import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet/services/storage_service.dart';

import '../enums/auth_state.dart';

final authStateNotifier = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({AuthState state = AuthState.UNKNOWN}) : super(state) {
    init();
  }

  Future<void> init() async {
    String? privateKey = await fetch();
    state = privateKey != null ? AuthState.SIGNED_IN : AuthState.SIGNED_OUT;
  }
}
