import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallet/services/account_notifier.dart';

import '../../components/base/spaces.dart';
import '../../components/actions/action_button.dart';
import '../../components/actions/action_icon.dart';
import '../../components/actions/icon_action_button.dart';

class Receive extends ConsumerWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountNotifierProvider);
    return ActionButton(
      action: () => account == null
          ? ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("No wallet found!"),
              ),
            )
          : showModalBottomSheet<void>(
              barrierColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              isDismissible: true,
              builder: (BuildContext context) => AddressShare(
                address: account.wallet.address,
              ),
            ),
      label: "Receive",
    );
  }
}

class AddressShare extends StatelessWidget {
  final String address;

  const AddressShare({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black54,
          body: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: SafeArea(
              minimum: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    height: 250,
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: QrImage(
                      data: address,
                      size: 200,
                    ),
                  ),
                  vLargeSpace,
                  Container(
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      address,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  vExtraLargeSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconActionButton(
                        icon: const Icon(Icons.copy),
                        action: () {
                          Clipboard.setData(
                            ClipboardData(text: address),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              width: 128,
                              content: Text(
                                "Copied",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        label: "COPY",
                      ),
                      hLargeSpace,
                      IconActionButton(
                        icon: const Icon(CupertinoIcons.share),
                        action: () => Share.share(address),
                        label: "SHARE",
                      ),
                    ],
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
