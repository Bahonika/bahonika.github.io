import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/models/snake.dart';
import 'package:flutter_snake/providers/snake_provider.dart';

import '../providers/is_active.dart';
import '../providers/timer_povider.dart';

class KeyboardMapper {
  Direction? fromKey(LogicalKeyboardKey key) {
    switch (key.keyLabel) {
      case 'A':
      case 'Arrow Left':
        return Direction.left;
      case 'S':
      case 'Arrow Down':
        return Direction.bottom;
      case 'W':
      case 'Arrow Up':
        return Direction.top;
      case 'D':
      case 'Arrow Right':
        return Direction.right;
    }
    return null;
  }
}

class MyKeyboardListener extends ConsumerStatefulWidget {
  final Widget child;

  const MyKeyboardListener({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyKeyboardListener> createState() => _MyKeyboardListenerState();
}

class _MyKeyboardListenerState extends ConsumerState<MyKeyboardListener> {
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();

    return RawKeyboardListener(
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          ref.watch(isActiveProvider.notifier).toggle();
        }
        ref.watch(snakeProvider.notifier).keyTurn(event.logicalKey);
      },
      focusNode: focus,
      autofocus: true,
      child: widget.child,
    );
  }
}
