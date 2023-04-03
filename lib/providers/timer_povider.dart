import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'difficult_provider.dart';
import 'is_turned_provider.dart';
import 'sound_provider.dart';
import 'ground_provider.dart';
import 'is_active.dart';
import 'is_game_over.dart';

class TimerNotifier extends StateNotifier<Timer> {
  final GroundNotifier groundNotifier;
  final IsActiveNotifier isActiveNotifier;
  final IsTurnedNotifier isTurnedNotifier;
  final SoundNotifier soundNotifier;
  final GameOverNotifier gameOverNotifier;
  final DifficultNotifier difficultNotifier;

  TimerNotifier(
    this.groundNotifier,
    this.isActiveNotifier,
    this.isTurnedNotifier,
    this.soundNotifier,
    this.gameOverNotifier,
    this.difficultNotifier,
  ) : super(
          Timer.periodic(
            difficultNotifier.difficult,
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

final timerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, Timer>((ref) {
  final groundNotifier = ref.watch(groundProvider.notifier);
  final isActiveNotifier = ref.watch(isActiveProvider.notifier);
  final isTurnedNotifier = ref.watch(isTurnedProvider.notifier);
  final soundNotifier = ref.watch(soundProvider.notifier);
  final gameOverNotifier = ref.watch(gameOverProvider.notifier);
  final difficultNotifier = ref.watch(difficultProvider.notifier);
  return TimerNotifier(
    groundNotifier,
    isActiveNotifier,
    isTurnedNotifier,
    soundNotifier,
    gameOverNotifier,
    difficultNotifier,
  );
});
