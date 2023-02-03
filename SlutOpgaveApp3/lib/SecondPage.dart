import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/main.dart';

// Klassen SecondPage er en tilstandsfuld widget, der har en opdateringsmetode og to initialer
// opdateringsmetoden bruges til at opdatere data i MainPage
// initialAnimals og initialName bruges til at opdatere oprindelige værdier i denne klasse

class SecondPage extends StatefulWidget {
  final Function updateData;
  final Animals initialAnimals;
  final String initialName;

  // Constructor til at tage de nødvendige værdier som argumenter
  SecondPage({
    required this.updateData,
    required this.initialAnimals,
    this.initialName = '', // explicit non-null default value
  }) : super(key: UniqueKey());

  @override
  _SecondPageState createState() => _SecondPageState();
}

// Tilstanden for SecondPage klassen, der opdaterer og holder styr på den valgte dyr og navn
class _SecondPageState extends State<SecondPage> {
  Animals _selectedAnimals = Animals.cat;
  String _name = "";
  final _textController = TextEditingController();

  // initState metoden sætter de oprindelige værdier til de modtagne værdier i konstruktøren
  @override
  void initState() {
    super.initState();
    _selectedAnimals = widget.initialAnimals;
    _name = widget.initialName;
    _textController.text = _name;
  }

  // dispose metoden frigør ressourcerne, når denne klasse ikke længere er aktiv
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anden side'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Skriv navnet på dit...',
              style: TextStyle(fontSize: 20),
            ),
            for (Animals animals in Animals.values)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dette er et radioknap, der gør det muligt for brugeren at vælge et dyr.
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
            Text("${_selectedAnimals.toString().split('.').last}'s navn"),
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
        child: const Text(
          'Send',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
