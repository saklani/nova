import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateWallet extends StatefulWidget {
  final PageController controller;
  final String mnemonic;

  const GenerateWallet({
    Key? key,
    required this.controller,
    required this.mnemonic,
  }) : super(key: key);

  @override
  State<GenerateWallet> createState() => _GenerateWalletState();
}

class _GenerateWalletState extends State<GenerateWallet> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.mnemonic));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Copied",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey.shade400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.mnemonic),
                const Icon(Icons.copy),
              ],
            ),
          ),
        ),
        const Spacer(),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
          title: Text(
            "If I lose my seed phrase I lose access to my funds.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        ElevatedButton(
          onPressed: _isChecked
              ? () => widget.controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInCirc,
                  )
              : null,
          child: const Text("I have saved my seed phrase"),
        )
      ],
    );
  }
}
