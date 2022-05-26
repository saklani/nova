import 'package:flutter/material.dart';

class IconActionButton extends StatelessWidget {
  final void Function()? action;
  final String label;
  final Widget icon;

  const IconActionButton({
    Key? key,
    required this.action,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 36,
        width: 92,
        color: Colors.white24,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 5),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
