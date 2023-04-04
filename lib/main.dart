import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_active.dart';
import 'package:flutter_snake/providers/is_game_over.dart';
import 'package:flutter_snake/ui/end_screen.dart';
import 'package:flutter_snake/ui/level_widget.dart';
import 'package:flutter_snake/ui/main_menu_screen.dart';
import 'package:flutter_snake/ui/pause_screen.dart';
import 'package:flutter_snake/utils/keyboard.dart';

final navigationKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyKeyboardListener(
      child: MaterialApp(
        title: 'Snake',
        routes: {
          '/mainMenu': (context) => const MainMenuScreen(),
          '/level': (context) => const LevelWidget(),
          '/pause': (context) => const PauseScreen(),
          '/over': (context) => const EndScreen(),
        },
        navigatorKey: ref.watch(navigationKeyProvider),
        initialRoute: 'mainMenu',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}
