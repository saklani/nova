import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet/services/storage_service.dart';

import 'wallet_service.dart';

final accountNotifierProvider = StateNotifierProvider<AccountNotifier, Web3?>(
  (ref) => AccountNotifier(),
);

class AccountNotifier extends StateNotifier<Web3?> {
  AccountNotifier({Web3? state}) : super(state) {
    init();
  }

  Future<void> init() async {
    String? privateKey = await fetch();
    if (privateKey != null) {
      state = Web3(
        privateKey,
        "wss://goerli.infura.io/ws/v3/---------------------",
        chainId: 5,
      );
    }
  }
}
