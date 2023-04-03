import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_active.dart';
import 'package:flutter_snake/providers/is_game_over.dart';

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
                  ref.read(isActiveProvider.notifier).isActive = true;
                  ref.read(gameOverProvider.notifier).isOver = false;
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
