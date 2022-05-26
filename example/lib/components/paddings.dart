import 'package:flutter/cupertino.dart';

class MediumPadding extends StatelessWidget {
  final Widget child;

  const MediumPadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
