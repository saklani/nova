import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/base/colors.dart';
import 'services/router_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const ProviderScope(child: Wallet()));
}

class Wallet extends ConsumerWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _router = ref.read(routerServiceProvider);
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Nebula',
      theme: ThemeData(
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.transparent,
          elevation: 8,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          contentTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          alignment: Alignment.center,
        ),
        appBarTheme: const AppBarTheme(color: zeus, elevation: 8),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return olympicBlue;
              }
              return gray98;
            },
          ),
        ),
        chipTheme: const ChipThemeData(backgroundColor: gray98),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                } else if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return olympicBlue; // Use the component's default.
              },
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: Colors.white),
            ),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.all(16),
          tileColor: zeus,
          textColor: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          modalElevation: 8,
          modalBackgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.black,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: olympicBlue, fontSize: 14),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 28, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 24, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white70),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: gray98,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 18),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: zeus,
          selectedItemColor: olympicBlue,
          unselectedItemColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
