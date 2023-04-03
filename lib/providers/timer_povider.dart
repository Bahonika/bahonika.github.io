import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/is_turned_provider.dart';
import 'package:flutter_snake/providers/sound_provider.dart';

import 'ground_provider.dart';
import 'is_active.dart';
import 'is_game_over.dart';

class TimerNotifier extends StateNotifier<Timer> {
  final GroundNotifier groundNotifier;
  final IsActiveNotifier isActiveNotifier;
  final IsTurnedNotifier isTurnedNotifier;
  final SoundNotifier soundNotifier;
  final GameOverNotifier gameOverNotifier;

  TimerNotifier(
    this.groundNotifier,
    this.isActiveNotifier,
    this.isTurnedNotifier,
    this.soundNotifier,
    this.gameOverNotifier,
  ) : super(
          Timer.periodic(
            const Duration(milliseconds: 400),
            (timer) {
              if (isActiveNotifier.isActive) {
                groundNotifier.update();
                final value = gameOverNotifier.isOver;
                if (value) {
                  isActiveNotifier.isActive = false;
                  soundNotifier.playSoundDied();
                }
                isTurnedNotifier.isTurnedAlready = false;
              }
            },
          ),
        );

  set isTurnedAlready(Timer value) => state = value;
}

final timerProvider = StateNotifierProvider<TimerNotifier, Timer>((ref) {
  final groundNotifier = ref.watch(groundProvider.notifier);
  final isActiveNotifier = ref.watch(isActiveProvider.notifier);
  final isTurnedNotifier = ref.watch(isTurnedProvider.notifier);
  final soundNotifier = ref.watch(soundProvider.notifier);
  final gameOverNotifier = ref.watch(gameOverProvider.notifier);
  return TimerNotifier(
    groundNotifier,
    isActiveNotifier,
    isTurnedNotifier,
    soundNotifier,
    gameOverNotifier,
  );
});
