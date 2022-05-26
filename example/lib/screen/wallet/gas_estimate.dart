import 'package:flutter/material.dart';

class GasEstimate extends StatelessWidget {
  final String gas;

  const GasEstimate({Key? key, required this.gas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Gas",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "~$gas ETH",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
