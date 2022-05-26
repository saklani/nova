import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final void Function()? action;
  final Icon icon;

  const ActionIcon({
    Key? key,
    required this.action,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 32,
        width: 32,
        color: Colors.white24,
        child: icon,
      ),
    );
  }
}
