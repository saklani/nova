import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/account_notifier.dart';
import '../../services/wallet_service.dart';

final balanceProvider = FutureProvider<String>((ref) {
  Web3? walletService = ref.watch(accountNotifierProvider);
  if (walletService != null) {
    return walletService.balance.then(
      (value) => (value.toDouble() / pow(10, 18)).toStringAsFixed(2),
    );
  } else {
    return '0.00';
  }
});

class Balance extends ConsumerWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> balance = ref.watch(balanceProvider);
    return balance.when(
      data: (data) => Text(
        "$data ETH",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      error: (err, _) => Text("Error $err"),
      loading: () => Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
