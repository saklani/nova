import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/nova.dart';
import 'package:wallet/services/storage_service.dart';
import 'package:wallet/utils/string_functions.dart';

import '../../components/base/colors.dart';
import '../../services/auth_notifier.dart';

class Return extends ConsumerStatefulWidget {
  const Return({Key? key}) : super(key: key);

  @override
  ConsumerState<Return> createState() => _ReturnState();
}

class _ReturnState extends ConsumerState<Return> {
  final _seedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: zeus),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 200),
            child: Wrap(
              runSpacing: 4,
              spacing: 4,
              children: [
                TextField(controller: _seedController, maxLength: 1200),
              ],
            ),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          child: const Text("Verify"),
          onPressed: () async {
            try {
              final mnemonic = _seedController.text;
              sanitize(mnemonic);
              await persist(derivePrivateKey(mnemonic));
              ref.refresh(authStateNotifier);
              context.go("/");
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Failed to load wallet",
                    textAlign: TextAlign.center,
                  ),
                  width: 256,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
