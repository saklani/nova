import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/nova.dart';
import 'package:wallet/services/auth_notifier.dart';
import 'package:wallet/services/storage_service.dart';

import '../../components/base/colors.dart';

class VerifySeed extends ConsumerStatefulWidget {
  final PageController controller;
  final String mnemonic;

  const VerifySeed({
    Key? key,
    required this.controller,
    required this.mnemonic,
  }) : super(key: key);

  @override
  ConsumerState<VerifySeed> createState() => _VerifySeedState();
}

// man van diesel pretty ramp immune essence goose nerve boy typical foster
class _VerifySeedState extends ConsumerState<VerifySeed> {
  List<String> _seedPhrase = [];
  List<String> _verifyPhrase = [];
  final List<bool> _hide = List.filled(12, false);
  final List<String> _selectedPhrase = [];

  @override
  void initState() {
    super.initState();
    _verifyPhrase = widget.mnemonic.split(' ');
    _seedPhrase = widget.mnemonic.split(' ');
    _seedPhrase.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    bool correct = listEquals(
      _selectedPhrase,
      _verifyPhrase.take(_selectedPhrase.length).toList(),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: correct ? Colors.grey : Colors.red,
            ),
            color: zeus,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 200),
            child: Wrap(
              runSpacing: 4,
              spacing: 4,
              children: _selectedPhrase
                  .map<Widget>(
                    (seed) => ActionChip(
                      label: Text(seed),
                      onPressed: () {
                        setState(() {
                          _hide[_seedPhrase.indexOf(_selectedPhrase.last)] =
                              false;
                          _selectedPhrase.removeLast();
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.all(8.0),
          child: !correct
              ? Center(
                  child: Text(
                    "Incorrect Seed Phrase",
                    style: TextStyle(color: Colors.red[300]),
                  ),
                )
              : Container(),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            runSpacing: 4,
            spacing: 4,
            children: _seedPhrase
                .where((String value) => !_hide[_seedPhrase.indexOf(value)])
                .map<Widget>(
                  (seed) => ActionChip(
                    label: Text(seed),
                    onPressed: () {
                      setState(() {
                        _selectedPhrase.add(seed);
                        _hide[_seedPhrase.indexOf(seed)] = true;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          child: const Text("Verify"),
          onPressed: listEquals(_selectedPhrase, _verifyPhrase)
              ? () async {
                  await persist(derivePrivateKey(widget.mnemonic));
                  await ref.read(authStateNotifier);
                  ref.refresh(authStateNotifier);
                  context.go("/");
                }
              : null,
        ),
      ],
    );
  }
}
