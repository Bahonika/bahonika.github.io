import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/difficult_provider.dart';
import 'package:flutter_snake/providers/is_active.dart';
import 'package:flutter_snake/providers/is_game_over.dart';
import 'package:flutter_snake/providers/level_provider.dart';

class MainMenuScreen extends ConsumerStatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(isActiveProvider.notifier)
                      .isActive = true;
                  Navigator.pushNamed(context, '/level');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Начать игру'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 40,
                        ),
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(levelProvider.notifier)
                                    .level(levels[0]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Classic',
                                style: TextStyle(
                                  color: ref.watch(levelProvider) == levels[0]
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(levelProvider.notifier)
                                    .level(levels[1]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Box',
                                style: TextStyle(
                                  color: ref.watch(levelProvider) == levels[1]
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(levelProvider.notifier)
                                    .level(levels[2]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Small',
                                style: TextStyle(
                                  color: ref.watch(levelProvider) == levels[2]
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(levelProvider.notifier)
                                    .level(levels[3]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Plus',
                                style: TextStyle(
                                  color: ref.watch(levelProvider) == levels[3]
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .watch(levelProvider.notifier)
                                    .level(levels[4]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Random',
                                style: TextStyle(
                                  color: ref.watch(levelProvider) == levels[4]
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выбор уровня'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        final currentDifficult =
                            ref.watch(difficultProvider).inMilliseconds;
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 40,
                            ),
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .watch(difficultProvider.notifier)
                                        .difficult = const Duration(
                                      milliseconds: 500,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Easy',
                                    style: TextStyle(
                                      color: currentDifficult == 500
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .watch(difficultProvider.notifier)
                                        .difficult = const Duration(
                                      milliseconds: 300,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Medium',
                                    style: TextStyle(
                                      color: currentDifficult == 300
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .watch(difficultProvider.notifier)
                                        .difficult = const Duration(
                                      milliseconds: 150,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Hard',
                                    style: TextStyle(
                                      color: currentDifficult == 150
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выбор сложности'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pause');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Настройки'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () => exit(0),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выход'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
