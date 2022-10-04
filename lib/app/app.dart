import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.blue[100],
      ),
    );

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}





// class DialogAlert extends StatefulWidget {
//   const DialogAlert({super.key});

//   @override
//   State<DialogAlert> createState() => _DialogAlertState();
// }

// class _DialogAlertState extends State<DialogAlert>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation animation;

//   @override
//   void initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..forward();
//     animation = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: animationController,
//         curve: const Interval(0, 0.5),
//       ),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: TextButton(
//         onPressed: () {
//           alertDialog(
//             context: context,
//             animationController: animationController,
//             title: 'Hola mundo!',
//           );
//         },
//         style: TextButton.styleFrom(
//           primary: Theme.of(context).colorScheme.onPrimary,
//           backgroundColor: Theme.of(context).colorScheme.onSurface,
//         ),
//         child: Text(
//           'Dialogo de alerta',
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.onBackground,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> alertDialog({
//     required BuildContext context,
//     final String? content,
//     final String? title,
//     final AnimationController? animationController,
//   }) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         buttonPadding: EdgeInsets.zero,
//         title: title != null ? Text(title) : null,
//         content: const Text('Esto es un contenido dentro del dialogo'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Aceptar'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancelar'),
//           ),
//         ],
//       ),
//     );
//   }
// }
