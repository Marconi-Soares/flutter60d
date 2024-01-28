import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarApp());
}

List<String> titles = <String>[
  'Cloud',
  'Beach',
  'Sunny',
];

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Sample'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.cloud_outlined),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.beach_access_sharp),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.brightness_5_sharp),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[0]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[2]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class DividerExampleApp extends StatelessWidget {
//   const DividerExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Divider Sample')),
//         body: const DividerExample(),
//       ),
//     );
//   }
// }
//
// class DividerExample extends StatelessWidget {
//   const DividerExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           const Expanded(
//             child: ColoredBox(
//               color: Colors.amber,
//               child: Center(
//                 child: Text('Above'),
//               ),
//             ),
//           ),
//           const Divider(
//             height: 20,
//             thickness: 5,
//             indent: 20,
//             endIndent: 0,
//             color: Colors.black,
//           ),
//           // Subheader example from Material spec.
//           // https://material.io/components/dividers#types
//           Container(
//             padding: const EdgeInsets.only(left: 20),
//             child: Align(
//               alignment: AlignmentDirectional.centerStart,
//               child: Text(
//                 'Subheader',
//                 style: Theme.of(context).textTheme.bodySmall,
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ColoredBox(
//               color: Theme.of(context).colorScheme.primary,
//               child: const Center(
//                 child: Text('Below'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AlertDialogExampleApp extends StatelessWidget {
//   const AlertDialogExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('AlertDialog Sample')),
//         body: const Center(
//           child: DialogExample(),
//         ),
//       ),
//     );
//   }
// }
// //
// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => _showMyDialog(context),
//       child: const Text('Show Dialog'),
//     );
//   }
//
//   Future<String?> _showMyDialog(BuildContext context) {
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('Alert Dialog Title'),
//         content: const Text('Alert Dialog description'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'Cancel'),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () => {Navigator.pop(context, 'OK')},
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MainApp2 extends StatelessWidget {
//   const MainApp2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorSchemeSeed: const Color(0xff6750a4),
//         useMaterial3: true,
//       ),
//       title: "Button types",
//       home: const Scaffold(body: ButtonTypesExample()),
//     );
//   }
// }
//
// class ButtonTypesExample extends StatefulWidget {
//   const ButtonTypesExample({super.key});
//
//   @override
//   State<ButtonTypesExample> createState() => _ButtonTypesExampleState();
// }
//
// class _ButtonTypesExampleState extends State<ButtonTypesExample> {
//   int volume = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4),
//       child: Center(
//         child: Column(
//           children: [
//             Text(
//               "volume: $volume",
//               style: TextStyle(fontSize: 25, color: Colors.grey[700]),
//             ),
//             IconButton(
//               icon: const Icon(Icons.volume_up),
//               padding: const EdgeInsets.all(20),
//               iconSize: 40,
//               onPressed: () =>
//                   setState(() => volume >= 100 ? volume = 0 : volume += 10),
//             ),
//             const AlertDialog(title: Text("Hello world"))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class ButtonTypesGroup extends StatelessWidget {
//   const ButtonTypesGroup({super.key, required this.enabled});
//
//   final bool enabled;
//
//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//         padding: EdgeInsets.all(4),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[ElevatedButton(onPressed: () {}, child:)]
//         ));
//   }
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const appName = 'Custom Themes';
//     return MaterialApp(
//       title: appName,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.dark,
//         ),
//         textTheme: const TextTheme(
//             displayLarge: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 72,
//             ),
//             titleLarge: TextStyle(
//               fontSize: 30,
//               fontStyle: FontStyle.italic,
//             ),
//             headlineLarge: TextStyle(fontSize: 50, color: Colors.blue)),
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Theme.of(context).colorScheme.primary,
//         child: Center(
//           child: Text("hello world",
//               style: Theme.of(context).textTheme.titleLarge),
//         ),
//       ),
//     );
//   }
// }
