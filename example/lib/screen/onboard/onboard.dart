import 'package:flutter/material.dart';
import 'package:supernova/supernova.dart';

import 'generate.dart';
import 'verify.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final _controller = PageController();
  late String _mnemonic;

  @override
  void initState() {
    super.initState();
    _mnemonic = generateMnemonic();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            GenerateWallet(
              controller: _controller,
              mnemonic: _mnemonic,
            ),
            VerifySeed(
              controller: _controller,
              mnemonic: _mnemonic,
            ),
          ],
        ),
      ),
    );
  }
}
