import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyAppBar"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_card),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Hello world"),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("We move under cover and we move as one"),
          const Text("Through the night, we have one shot to live another day"),
          const Text("We cannot let a stray gunshot give us away"),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: 48.0,
              height: 48.0,
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 +
                      200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.1),
            child: Text(
              "hello world",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints.expand(
                height:
                    Theme.of(context).textTheme.headlineMedium!.fontSize! * 2,
                width: 300.0,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              color: Colors.red,
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "Olá mundo2",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class AppBarApp extends StatelessWidget {
//   const AppBarApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorSchemeSeed: const Color(0xff6750a4),
//         useMaterial3: true,
//       ),
//       home: const AppBarExample(),
//     );
//   }
// }
//
// final List<int> _items = List<int>.generate(51, (index) => index);
//
// class AppBarExample extends StatefulWidget {
//   const AppBarExample({super.key});
//
//   @override
//   State<AppBarExample> createState() => _AppBarExampleState();
// }
//
// class _AppBarExampleState extends State<AppBarExample> {
//   bool shadowColor = false;
//   double? scrolledUnderElevation;
//
//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;
//     final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
//     final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AppBar: Demo"),
//         scrolledUnderElevation: scrolledUnderElevation,
//         shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
//       ),
//       body: GridView.builder(
//         itemCount: _items.length,
//         padding: const EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 2.0,
//           mainAxisExtent: 10.0,
//           crossAxisSpacing: 10.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           if (index == 0) {
//             return Center(
//               child: Text(
//                 "Scroll to see the appbar in effect.",
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),
//             );
//           }
//           return Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20.0),
//               color: _items[index].isOdd ? oddItemColor : evenItemColor,
//             ),
//             child: Text(
//               "Item $index",
//               style: Theme.of(context).textTheme.labelLarge,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// class AppBarApp extends StatelessWidget {
//   const AppBarApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: AppBarExample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class AppBarExample extends StatelessWidget {
//   const AppBarExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Marconi Bar"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add_alarm),
//             tooltip: 'Show Snackbar',
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text(
//                     "Marconi",
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) {
//                     return Scaffold(
//                       appBar: AppBar(
//                         title: const Text("Page 2"),
//                         actions: <Widget>[
//                           IconButton(
//                             icon: const Icon(Icons.add_box),
//                             tooltip: "Show SnackBar",
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                     "Marconi2",
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       body: const Center(
//                         child: Text(
//                           "This is the next page.",
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: Colors.green,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(Icons.navigate_next),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: MyContainer(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyContainer extends StatefulWidget {
//   const MyContainer({super.key});
//
//   @override
//   State<MyContainer> createState() => _MyContainerState();
// }
//
// class _MyContainerState extends State<MyContainer> {
//   Color colorContainer = Colors.red;
//   bool isTurnOn = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         isTurnOn = !isTurnOn;
//         setState(() {});
//       },
//       child: Container(
//         height: 100,
//         width: 100,
//         color: isTurnOn ? Colors.red : Colors.black,
//       ),
//     );
//   }
// }
