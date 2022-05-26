import 'package:flutter/material.dart';
import 'package:wallet/components/base/spaces.dart';

import '../../screen/wallet/receive.dart';
import '../../screen/wallet/send.dart';

class WalletActions extends StatelessWidget {
  const WalletActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Receive(),
          hMediumSpace,
          Send(),
        ],
      ),
    );
  }
}
