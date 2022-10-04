import 'package:animation_customs/pages/animation_with_interval.dart';
import 'package:animation_customs/pages/animation_with_tween_sequence.dart';
import 'package:animation_customs/pages/custom_animated_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(CustomAnimatedContainer.route());
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Custom Animated Container'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(AnimationWithIntertaval.route());
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Animation with Interval'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(AnimationWithTweenSequence.route());
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: const Text('Animation with Tween Sequence'),
            ),
          ],
        ),
      ),
    );
  }
}
