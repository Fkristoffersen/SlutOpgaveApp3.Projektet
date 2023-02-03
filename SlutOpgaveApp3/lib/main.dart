import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/SecondPage.dart';
import 'package:slutopgavehentnavnogfarve/ThirdPage.dart';

// Dette er den primære funktion, der starter Flutter-applikationen.
void main() => runApp(MyApp());

// `MyApp` er en `StatelessWidget`, der returnerer en `MaterialApp`-widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // `title` er titlen på applikationen.
      title: _title,
      // `home` er startsiden på applikationen.
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

// Klassen _MainPageState er en udvidelse af State, som bruges til at vedligeholde tilstanden til widget'en MainPage.
class _MainPageState extends State<MainPage> {
  // Variablen `name` bruges til at gemme navnet på dyret.
  String name = '';
  // Variablen `selectedAnimals` bruges til at gemme det valgte dyr/person.
  Animals selectedAnimals = Animals.values[0];

  // initState metoden bliver kaldt, når denne tilstand bliver oprettet.
  @override
  void initState() {
    // Sæt `name` til værdien i widget.name.
    name = widget.name;
    // Sæt `selectedAnimals` til værdien i widget.selectedAnimal.
    selectedAnimals = widget.selectedAnimal;
    super.initState();
  }

  // Metoden `updateData` opdaterer værdierne i `selectedAnimals` og `name`.
  void updateData(Animals animals, String text) {
    setState(() {
      selectedAnimals = animals;
      name = text;
    });
  }

  // build metoden bruges til at definere, hvordan widgeten ser ud.
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
