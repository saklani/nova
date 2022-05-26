import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/actions/action_button.dart';
import '../../components/actions/action_icon.dart';
import '../../components/actions/icon_action_button.dart';
import '../../components/base/spaces.dart';
import '../../utils/string_functions.dart';
import 'confirm_transaction.dart';

class Send extends StatelessWidget {
  const Send({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      action: () => showModalBottomSheet<void>(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) => const SendFunds(),
      ),
      label: "Send",
    );
  }
}

class SendFunds extends StatefulWidget {
  const SendFunds({Key? key}) : super(key: key);

  @override
  State<SendFunds> createState() => _SendFundsState();
}

class _SendFundsState extends State<SendFunds> {
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black54,
          body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SafeArea(
              minimum: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionIcon(
                        action: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.xmark),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _addressController,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Wallet address",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  vMediumSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconActionButton(
                        action: () async {
                          final data = await Clipboard.getData(
                            'text/plain',
                          );
                          final text = data?.text ?? "";
                          try {
                            final address = sanitize(text);
                            _addressController.value = TextEditingValue(
                              text: address,
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                width: 256,
                                content: Text(
                                  "Invalid Ethereum Address",
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(CupertinoIcons.doc_on_clipboard),
                        label: "PASTE",
                      ),
                    ],
                  ),
                  vExtraLargeSpace,
                  SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _amountController,
                      cursorColor: Colors.black,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Amount",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                            width: 0.5,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          width: 72,
                          child: Center(
                            child: Text(
                              "ETH",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  vExtraLargeSpace,
                  vExtraLargeSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConfirmTransaction(
                            to: _addressController.text,
                            amount: _amountController.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 84,
                      color: Colors.white24,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(CupertinoIcons.arrow_turn_up_right),
                            hSmallSpace,
                            Text(
                              "SEND",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
