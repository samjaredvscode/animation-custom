import 'package:flutter/material.dart';

class AnimationWithIntertaval extends StatefulWidget {
  const AnimationWithIntertaval({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const AnimationWithIntertaval());

  @override
  State<AnimationWithIntertaval> createState() =>
      _AnimationWithIntertavalState();
}

class _AnimationWithIntertavalState extends State<AnimationWithIntertaval>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )
      ..forward()
      ..repeat(reverse: true);

    _animationController.addListener(() {
      setState(() {});
    });

    _sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.elasticInOut),
      ),
    );

    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.green[300])
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.8),
    ));

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
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      decoration: BoxDecoration(
                        color: _colorAnimation.value,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              top: 50,
              left: 5,
              child: DecoratedBox(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop<void>();
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
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
