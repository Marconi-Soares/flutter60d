import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            focusNode: _myFocusNode,
            validator: (value) => validateFormField(value),
          ),
          ElevatedButton(onPressed: submit, child: const Text("Submit"))
        ],
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Processing Data"),
        ),
      );
    }
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    int? intValue = int.tryParse(value);
    if (intValue == null) {
      return 'The value must be a number';
    }

    return null;
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  final myFocusNode = FocusNode();
  String res = "";

  @override
  void initState() {
    super.initState();
    myController.addListener(_updateTextValue);
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: TextFormField(
            focusNode: myFocusNode,
            controller: myController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: "Olá mundo",
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //   child: TextFormField(
        //     decoration: const InputDecoration(
        //       enabledBorder: UnderlineInputBorder(
        //         borderSide: BorderSide(color: Colors.red),
        //       ),
        //       focusedBorder: UnderlineInputBorder(
        //         borderSide: BorderSide(color: Colors.yellow),
        //       ),
        //       labelText: 'Enter your username',
        //       labelStyle: TextStyle(color: Colors.red),
        //       floatingLabelStyle: TextStyle(color: Colors.yellow),
        //     ),
        //   ),
        // ),
        const SizedBox(height: 30),
        Center(child: Text(res)),
        Center(
          child: IconButton(
            onPressed: () => myFocusNode.requestFocus(),
            icon: Icon(
              Icons.circle,
              color: Colors.purple[700],
            ),
          ),
        )
      ],
    );
  }

  void _updateTextValue() {
    setState(() {
      res = myController.text;
    });
  }
}
