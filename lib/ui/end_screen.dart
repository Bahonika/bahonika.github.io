import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_game_over.dart';

class EndScreen extends ConsumerStatefulWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends ConsumerState<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Over',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .watch(gameOverProvider.notifier)
                    .isOver = false;
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/mainMenu'),
                );
              },
              child: const Text(
                'Главное меню',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
