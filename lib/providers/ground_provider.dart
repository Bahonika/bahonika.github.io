import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake/main.dart';
import 'package:flutter_snake/models/block.dart';
import 'package:flutter_snake/models/ground.dart';
import 'package:flutter_snake/providers/food_provider.dart';
import 'package:flutter_snake/providers/is_game_over.dart';
import 'package:flutter_snake/providers/level_provider.dart';
import 'package:flutter_snake/providers/snake_provider.dart';

class GroundNotifier extends StateNotifier<Ground> {
  final LevelNotifier levelNotifier;
  final SnakeNotifier snakeNotifier;
  final FoodNotifier foodNotifier;
  final GameOverNotifier gameOverNotifier;
  final SnakeBodyNotifier snakeBodyNotifier;
  final GlobalKey<NavigatorState> navigationKey;

  GroundNotifier(
    this.levelNotifier,
    this.snakeNotifier,
    this.foodNotifier,
    this.gameOverNotifier,
    this.navigationKey,
    this.snakeBodyNotifier,
    Ground initialGround,
  ) : super(initialGround);

  void update() {
    if (snakeBodyNotifier.mounted) {
      final snakeTailBeforeMove = snakeBodyNotifier.body.first;
      final isLose = snakeNotifier.move();

      if (isLose) {
        gameOverNotifier.isOver = true;
        final context = navigationKey.currentContext;
        if (context != null) {
          Navigator.pushNamed(context, '/over');
        }
        return;
      }

      final snakeBody = snakeBodyNotifier.body;

      setBlock(snakeTailBeforeMove, BlockType.blank);
      setBlock(snakeBody.first, BlockType.snake);
      setBlock(snakeBody.last, BlockType.snake);
      setBlock(foodNotifier.food, BlockType.food);
    }
  }

  void setBlock(
    int index,
    BlockType type,
  ) {
    List<Block> tempList = List.from(grid);
    tempList.removeAt(index);
    tempList.insert(index, Block(type: type));

    state = state.copyWith(grid: tempList);
  }

  List<Block> get grid => state.grid;

  set grid(List<Block> value) => state.copyWith(grid: value);
}

final groundProvider =
    StateNotifierProvider.autoDispose<GroundNotifier, Ground>((ref) {
  final level = ref.watch(levelProvider.notifier);
  final snake = ref.watch(snakeProvider.notifier);
  final food = ref.watch(foodProvider.notifier);
  final gameOver = ref.watch(gameOverProvider.notifier);

  final walls = List.from(level.walls);
  walls.sort();
  final ground = Ground(
    grid: List.generate(
      level.columns * level.rows,
      (index) {
        if (walls.contains(index)) {
          return const Block(
            type: BlockType.wall,
          );
        }
        return const Block(
          type: BlockType.blank,
        );
      },
    ),
  );

  return GroundNotifier(
    level,
    snake,
    food,
    gameOver,
    ref.watch(navigationKeyProvider),
    ref.watch(snakeBodyProvider.notifier),
    ground,
  );
});

final gridProvider = StateProvider.autoDispose<List<Widget>>((ref) {
  Color colorFromType(BlockType type) {
    switch (type) {
      case BlockType.blank:
        return Colors.white38;
      case BlockType.snake:
        return Colors.white;
      case BlockType.food:
        return Colors.green;
      case BlockType.wall:
        return Colors.orange;
    }
  }

  Widget toWidget(Block block) => Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            color: colorFromType(block.type),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );

  return ref.watch(groundProvider).grid.map((e) => toWidget(e)).toList();
});
