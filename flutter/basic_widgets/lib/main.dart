import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            child: ListWheelScrollView(
                itemExtent: 100,
                diameterRatio: 0.5,
                children: List.generate(100, (i) => Text("Title $i"))),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyLargeList extends StatelessWidget {
  const MyLargeList({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.builder(
          itemCount: 100,
          prototypeItem: ListTile(title: Text(items.first)),
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          }),
    );
  }
}

class MyLayoutBuild extends StatelessWidget {
  const MyLayoutBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const int numItems = 15;
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                numItems,
                (index) => ItemWidget(text: 'Item $index'),
              ),
            )),
      );
    });
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildStubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildStubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildStubtitle(BuildContext context) => Text(body);
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(
      50,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildStubtitle(context),
        );
      },
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: List.generate(100, (index) {
        return Center(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'Item $index',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ));
      }),
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
