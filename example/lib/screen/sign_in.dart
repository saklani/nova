import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/base/spaces.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => context.go("/onboard"),
              child: const Text("Create a new wallet"),
            ),
            vLargeSpace,
            TextButton(
              onPressed: () => context.go("/return"),
              child: const Text("I have an existing wallet"),
            )
          ],
        ),
      ),
    );
  }
}
