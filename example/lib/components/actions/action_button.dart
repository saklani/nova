import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function()? action;
  final String label;

  const ActionButton({
    Key? key,
    required this.action,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 42,
        width: 96,
        color: Colors.white24,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
