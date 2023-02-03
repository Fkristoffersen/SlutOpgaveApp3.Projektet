import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/SecondPage.dart';
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
        selectedAnimal: Animals.dog,
        color: const Color(0xFF3E3E),
      ),
    );
  }
}

enum Animals {
  mother,
  father,
  cat,
  dog,
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
        title: const Text('Main Page'),
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
            const Text(
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
              child: const Text('Get ones name'),
            ),
            Text(
              '${selectedAnimals.toString().split('.').last}s name: $name',
              style: const TextStyle(fontSize: 20),
            ),
            Visibility(
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
                child: const Text('Get ones colour'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
