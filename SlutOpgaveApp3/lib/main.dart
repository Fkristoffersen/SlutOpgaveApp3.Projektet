import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/ThirdPage.dart';

// This is the main function, which starts the Flutter application.
void main() => runApp(MyApp());

// `MyApp` is a `StatelessWidget` which returns a `MaterialApp` widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // `title` is the title of the application.
      title: _title,
      // `home` is the home page of the application.
      home: MainPage(
        name: '',
        selectedAnimal: Animals.Dog,
        color: Color(0xFF000000),
      ),
    );
  }
}

enum Animals {
  Mother,
  Father,
  Cat,
  Dog,
}

class MainPage extends StatefulWidget {
  final Color color;
  final String name;
  final Animals selectedAnimal;

  MainPage({
    required this.name,
    required this.selectedAnimal,
    required this.color,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = '';
  Animals selectedAnimals = Animals.values[0];

  @override
  void initState() {
    name = widget.name;
    selectedAnimals = widget.selectedAnimal;
    super.initState();
  }

  void updateData(Animals animals, String text) {
    setState(() {
      selectedAnimals = animals;
      name = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: widget.color,
              width: 100.0,
              height: 100.0,
            ),
            Text(
              'Get ones name and colour',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      updateData: updateData,
                      initialAnimals: selectedAnimals,
                      initialName: name,
                    ),
                  ),
                );
              },
              child: Text('Get ones name'),
            ),
            Text(
              '${selectedAnimals.toString().split('.').last}s name: $name',
              style: TextStyle(fontSize: 20),
            ),
            Visibility(
              visible: name.isNotEmpty,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(
                        updateData: updateData,
                        initialAnimals: selectedAnimals,
                        initialName: name,
                        animalName: '',
                        selectedAnimal: selectedAnimals,
                      ),
                    ),
                  );
                },
                child: Text('Get ones colour'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
