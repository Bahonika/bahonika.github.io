import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/main.dart';
import 'package:flutter_snake/ui/pause_screen.dart';
import 'package:flutter_snake/utils/keyboard.dart';

import '../models/snake.dart';
import '../providers/ground_provider.dart';
import '../providers/is_active.dart';
import '../providers/level_provider.dart';
import '../providers/music_provider.dart';
import '../providers/snake_provider.dart';
import '../providers/timer_povider.dart';

class LevelWidget extends ConsumerStatefulWidget {
  const LevelWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends ConsumerState<LevelWidget> {
  Duration duration = const Duration(milliseconds: 100);

  void openHelp() {
    final context = ref.watch(navigationKeyProvider).currentContext;
    if (context != null) {
      Navigator.pushNamed(context, '/pause');
      ref.read(isActiveProvider.notifier).isActive = false;
    }
  }

  @override
  void initState() {
    super.initState();
    ref.read(soundProviderBack.notifier).playMusic();
    ref.read(timerProvider);
  }

  @override
  Widget build(BuildContext context) {
    final level = ref.watch(levelProvider);
    final grid = ref.watch(gridProvider);

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 400,
                minHeight: 700,
                maxHeight: 700,
                maxWidth: 400,
              ),
              child: GridView.count(
                crossAxisCount: level.columns,
                children: grid,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ControllerWidget(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: openHelp,
              icon: const Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ControllerWidget extends ConsumerWidget {
  const ControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snakeNotifier = ref.watch(snakeProvider.notifier);
    return SizedBox(
      height: 180,
      width: 180,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
              (index) {
            if (index == 1) {
              return InkWell(
                onTap: () {
                  snakeNotifier.turn(Direction.top);
                },
                child: Container(
                  color: Colors.purple,
                  child: const Icon(Icons.arrow_upward),
                ),
              );
            } else if (index == 3) {
              return InkWell(
                onTap: () {
                  snakeNotifier.turn(Direction.left);
                },
                child: Container(
                  color: Colors.purple,
                  child: const Icon(Icons.arrow_back),
                ),
              );
            } else if (index == 5) {
              return InkWell(
                onTap: () {
                  snakeNotifier.turn(Direction.right);
                },
                child: Container(
                  color: Colors.purple,
                  child: const Icon(Icons.arrow_forward),
                ),
              );
            } else if (index == 7) {
              return InkWell(
                onTap: () {
                  snakeNotifier.turn(Direction.bottom);
                },
                child: Container(
                  color: Colors.purple,
                  child: const Icon(Icons.arrow_downward),
                ),
              );
            } else {
              return Container(color: Colors.transparent);
            }
          },
        ),
      ),
    );
  }
}
