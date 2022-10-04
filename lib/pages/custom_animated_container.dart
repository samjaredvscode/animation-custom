import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({super.key});
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CustomAnimatedContainer());

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  var color = Colors.red;
  double heigth = 100.0;
  double width = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AnimatedContainer(
                    curve: Curves.linearToEaseOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: color,
                    ),
                    duration: const Duration(seconds: 1),
                    width: width,
                    height: heigth,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    color = Colors.green;
                    heigth = MediaQuery.of(context).size.height;
                    width = MediaQuery.of(context).size.width;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onSurface,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: const Text('Animar'),
                ),
                TextButton(
                  onPressed: () {
                    color = Colors.red;
                    heigth = 100;
                    width = 100;
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onSurface,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: const Text('Inicio'),
                ),
              ],
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
