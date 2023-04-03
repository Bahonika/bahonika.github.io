import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/providers/music_provider.dart';
import 'package:flutter_snake/providers/sound_provider.dart';
import 'package:flutter_snake/utils/keyboard.dart';

import '../providers/is_active.dart';

class PauseScreen extends ConsumerStatefulWidget {
  const PauseScreen({super.key});

  @override
  ConsumerState<PauseScreen> createState() => _PauseScreenState();
}

class _PauseScreenState extends ConsumerState<PauseScreen> {
  @override
  Widget build(BuildContext context) {
    final music = ref.watch(soundProviderBack.notifier);
    final sound = ref.watch(soundProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Пауза'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            ref.read(isActiveProvider.notifier).isActive = true;
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                music.isPlaying == true ? Icons.music_note : Icons.music_off,
              ),
              onPressed: () {
                if (music.isPlaying) {
                  music.pause();
                } else {
                  music.playMusic();
                }
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                sound.isPlaying ? Icons.volume_down : Icons.volume_off,
              ),
              onPressed: () {
                sound.toggle();
                setState(() {});
              },
            ),
            Slider(
              value: music.volume,
              onChanged: (value) {
                music.setVolume(value);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
