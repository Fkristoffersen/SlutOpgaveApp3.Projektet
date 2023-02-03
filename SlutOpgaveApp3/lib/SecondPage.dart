import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/main.dart';

class SecondPage extends StatefulWidget {
  final Function updateData;
  final Animals initialAnimals;
  final String initialName;

  SecondPage({
    required this.updateData,
    required this.initialAnimals,
    this.initialName = '', // explicit non-null default value
  }) : super(key: UniqueKey());

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Animals _selectedAnimals = Animals.Cat;
  String _name = "";
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedAnimals = widget.initialAnimals;
    _name = widget.initialName;
    _textController.text = _name;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Write the name of your......',
              style: TextStyle(fontSize: 20),
            ),
            for (Animals animals in Animals.values)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // This is a radio button that allows the user to select an animal.
                  Radio(
                    value: animals,
                    groupValue: _selectedAnimals,
                    onChanged: (value) {
                      setState(() {
                        _selectedAnimals = value as Animals;
                      });
                    },
                  ),
                  Text(animals.toString().split('.').last),
                ],
              ),
            Text("${_selectedAnimals.toString().split('.').last}'s name"),
            TextField(
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          widget.updateData(_selectedAnimals, _name);
          Navigator.pop(context);
        },
        child: Text(
          'Send',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
