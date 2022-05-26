import 'package:flutter/material.dart';

import '../components/wallet/balance.dart';
import '../components/wallet/wallet_actions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Balance(),
          WalletActions(),
        ],
      ),
    );
  }
}
