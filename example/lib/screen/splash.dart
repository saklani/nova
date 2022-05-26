import 'package:flutter/material.dart';

import '../components/base/app_title.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: AppTitle(),
        ),
      );
}
