import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyContainer(),
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  Color colorContainer = Colors.red;
  bool isTurnOn = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isTurnOn = !isTurnOn;
        setState(() {});
      },
      child: Container(
        height: 100,
        width: 100,
        color: isTurnOn ? Colors.red : Colors.black,
      ),
    );
  }
}
