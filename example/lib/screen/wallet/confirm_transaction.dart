import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../components/base/colors.dart';
import '../../components/base/spaces.dart';
import '../../services/account_notifier.dart';
import '../../services/wallet_service.dart';
import 'gas_estimate.dart';

class GasProviderInput extends Equatable {
  final String address;
  final BigInt amount;

  const GasProviderInput(this.address, this.amount);

  @override
  List<Object?> get props => [address, amount];
}

final estimateGasProvider =
    FutureProvider.family<String, GasProviderInput>((ref, data) {
  Web3? walletService = ref.watch(accountNotifierProvider);
  if (walletService != null) {
    return walletService
        .estimateGas(
          to: data.address,
          value: data.amount,
        )
        .then(
          (value) => (value.toDouble() / pow(10, 18)).toStringAsFixed(7),
        );
  } else {
    return "0.00";
  }
});

class ConfirmTransaction extends ConsumerStatefulWidget {
  final String to;
  final String amount;

  const ConfirmTransaction({
    Key? key,
    required this.to,
    required this.amount,
  }) : super(key: key);

  @override
  ConsumerState<ConfirmTransaction> createState() => _ConfirmTransactionState();
}

class _ConfirmTransactionState extends ConsumerState<ConfirmTransaction> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    BigInt wei = BigInt.from(double.parse(widget.amount) * pow(10, 18));
    final gasProviderInput = GasProviderInput(
      widget.to,
      wei,
    );
    final AsyncValue<String> gas = ref.watch(
      estimateGasProvider(gasProviderInput),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("SEND"),
      ),
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: gas.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "${widget.amount} ETH",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(flex: 2, child: GasEstimate(gas: data)),
              Flexible(
                flex: 3,
                child: Container(
                  color: zeus,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "${widget.amount} ETH",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "~$data ETH",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.right,
                      ),
                      const Spacer(),
                      Text(
                        "~ ${double.parse(widget.amount) + double.parse(data)} ETH",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.end,
                      ),
                      vExtraLargeSpace,
                      vExtraLargeSpace,
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _loading = true;
                          });
                          try {
                            await ref
                                .read(accountNotifierProvider)
                                ?.sendTransaction(
                                  to: widget.to,
                                  value: wei,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Transaction Sent"),
                              ),
                            );
                            context.go("/");
                          } catch (e) {
                            debugPrint(e.toString());
                          } finally {
                            setState(() {
                              _loading = false;
                            });
                          }
                        },
                        child: Container(
                          height: 48,
                          width: 84,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: _loading
                                ? const CircularProgressIndicator()
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(CupertinoIcons.arrow_turn_up_right),
                                      hSmallSpace,
                                      Text(
                                        "Confirm",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          error: (err, _) {
            print(err);
            return const Center(child: Text("Error"));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
