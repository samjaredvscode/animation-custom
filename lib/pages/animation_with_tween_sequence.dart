import 'package:flutter/material.dart';

class AnimationWithTweenSequence extends StatefulWidget {
  const AnimationWithTweenSequence({super.key});

  static Route route() => MaterialPageRoute(
      builder: (context) => const AnimationWithTweenSequence());

  @override
  State<AnimationWithTweenSequence> createState() =>
      _AnimationWithTweenSequenceState();
}

class _AnimationWithTweenSequenceState extends State<AnimationWithTweenSequence>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimated;
  late Animation _colorAnimated;
  late Animation _colorAnimatedTwo;
  bool isFavorite = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _sizeAnimated = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 0, end: 150), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 150, end: 50), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50, end: 200), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 200, end: 0), weight: 1),
      ],
    ).animate(_animationController);

    _colorAnimated = TweenSequence(
      <TweenSequenceItem>[
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.white, end: Colors.green),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.green, end: Colors.blue),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.blue, end: Colors.red[300]),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.red[300], end: Colors.white),
            weight: 10),
      ],
    ).animate(_animationController);
    _colorAnimatedTwo = TweenSequence(
      <TweenSequenceItem>[
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.red, end: Colors.green),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.green, end: Colors.blue),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.blue, end: Colors.white),
            weight: 10),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.white, end: Colors.red),
            weight: 10),
      ],
    ).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFavorite = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFavorite = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _colorAnimated.value,
                    borderRadius: BorderRadius.circular(_sizeAnimated.value),
                  ),
                  height: _sizeAnimated.value,
                  width: _sizeAnimated.value,
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: _colorAnimatedTwo.value,
                    borderRadius: BorderRadius.circular(_sizeAnimated.value),
                  ),
                  height: _sizeAnimated.value,
                  width: _sizeAnimated.value,
                ),
              ],
            ),
            Positioned(
              bottom: 100,
              child: TextButton(
                onPressed: () {
                  isFavorite
                      ? _animationController.repeat()
                      : _animationController.forward();
                },
                style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.onSurface,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Animar!'),
              ),
            ),
            Positioned(
              top: 50,
              left: 5,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop<void>();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
