import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Wallet",
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
