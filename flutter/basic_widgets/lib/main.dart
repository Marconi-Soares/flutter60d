import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: const Text("Counter"),
        actions: [
          TextButton(
            onPressed: () => setState(() => counter = 0),
            child: const Row(
              children: [
                Text("reset", style: TextStyle(color: Colors.white70)),
                Icon(Icons.restart_alt, color: Colors.white70)
              ],
            ),
          ),
        ],
      ),
      body: const MyLayout(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[700],
        mini: false,
        onPressed: () => setState(() => counter++),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white70,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "estudos"),
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.purple[700],
          child: const Center(
            child: Text("Hello world"),
          )),
    );
  }
}

class MyLayout extends StatelessWidget {
  final baseURL = 'https://flutter.github.io/assets-for-api-docs/assets';

  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSource = '$baseURL/widgets/owl.jpg';
    return SizedBox(
      height: 120,
      child: ListView(),
    );
  }
}

class MyImage extends StatelessWidget {
  final baseURL = 'https://flutter.github.io/assets-for-api-docs/assets';

  const MyImage({super.key});
  @override
  Widget build(BuildContext context) {
    const paragraph =
        "Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.";
    final imageSource = '$baseURL/widgets/owl.jpg';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageSource,
            height: 300,
            width: 300,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alfredo",
                style: TextStyle(
                  height: 2.0,
                  fontSize: 50,
                  color: Colors.grey[600],
                ),
              ),
              const Text(paragraph,
                  textAlign: TextAlign.justify, style: TextStyle(fontSize: 20))
            ],
          ),
        )
      ],
    );
  }
}

class IconsExample extends StatefulWidget {
  const IconsExample({super.key});

  @override
  State<IconsExample> createState() => _IconsExampleState();
}

class _IconsExampleState extends State<IconsExample> {
  bool isHorizontal = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconsList(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: isHorizontal,
                onChanged: (value) => setState(() => isHorizontal = value),
              ),
              const SizedBox(width: 20),
              Text(
                isHorizontal ? "vertical" : "horizontal",
                style: const TextStyle(
                  fontSize: 35,
                  fontFamily: 'serif',
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> icons() {
    return const [
      Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 100,
      ),
      Icon(
        Icons.audiotrack,
        color: Colors.green,
        size: 100,
      ),
      Icon(
        Icons.beach_access,
        color: Colors.blue,
        size: 100,
      ),
    ];
  }

  Widget iconsList() {
    if (isHorizontal) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: icons(),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons(),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle addBtnStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.green,
    );
    final ButtonStyle subBtnStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.red,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "$counter",
              style:
                  const TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: subBtnStyle,
                  onPressed: () => setState(() => counter--),
                  child: const Text(
                    "SUB",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: addBtnStyle,
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => setState(() => counter++),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
