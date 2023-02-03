import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/main.dart';

// Klassen "ThirdPage" er en "StatefulWidget", hvilket betyder, at den har en tilknyttet tilstand (state)
class ThirdPage extends StatefulWidget {
  // Funktionen "updateData" bruges til opdatering af data
  final updateData;

  // "initialAnimals" er en liste af dyr
  final Animals initialAnimals;

  // "initialName" er en startværdi for navnet
  final String initialName;

  // "animalName" er et navn på et dyr
  final String animalName;

  // "selectedAnimal" er et valgt dyr
  final Animals selectedAnimal;

  // "selectedAnimals" er en kopi af "selectedAnimal"
  Animals selectedAnimals;

  // Konstruktøren tager en række nødvendige og valgfrie argumenter
  ThirdPage({
    this.updateData,
    required this.initialAnimals,
    required this.initialName,
    required this.animalName,
    required this.selectedAnimal,
  }) : selectedAnimals = selectedAnimal;

  // Metoden "createState" opretter tilstanden til widget'et
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

// Klassen "_ThirdPageState" er tilstanden for "ThirdPage"-widget'et
class _ThirdPageState extends State<ThirdPage> {
  // Variablerne "red", "green", og "blue" er hexadecimale værdier for farver
  String red = 'FF0000';
  String green = '00FF00';
  String blue = '0000FF';

// Metoden "build" returnerer et "Scaffold"-widget, som er en basis-skabelon til en app-side
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App-baren viser en overskrift
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      // body på siden består af et "Center"-widget med en "Column"-widget indeni
      body: Center(
        child: Column(
          // "mainAxisAlignment" definerer, at widgets i "Column"-widget'et skal centreres
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Container"-widget'et viser en farve baseret på de tre hexadecimale værdier
            Container(
              color: Color.fromRGBO(
                int.parse(red, radix: 16),
                int.parse(green, radix: 16),
                int.parse(blue, radix: 16),
                1.0,
              ),
              width: 100.0,
              height: 100.0,
            ),
            // "DropdownButton"-widget'et lader brugeren vælge en hexadecimal værdi for rød farve
            DropdownButton<String>(
              value: red,
              items: const [
                DropdownMenuItem(
                  value: 'FF0000',
                  child: Text('FF0000'),
                ),
                DropdownMenuItem(
                  value: 'FF3E3E',
                  child: Text('FF3E3E'),
                ),
                DropdownMenuItem(
                  value: 'FF7D7D',
                  child: Text('FF7D7D'),
                ),
              ],
              // Indstil værdien af variablen "red" til den valgte værdi når dropdown-menuen ændres
              // Funktionen setState() opdaterer UI'et når værdien ændres
              onChanged: (value) {
                setState(() {
                  red = value!;
                });
              },
            ),
            // "DropdownButton"-widget'et lader brugeren vælge en hexadecimal værdi for grøn farve
            DropdownButton<String>(
              value: green,
              items: const [
                DropdownMenuItem(
                  value: '3EFF3E',
                  child: Text('3EFF3E'),
                ),
                DropdownMenuItem(
                  value: '00FF00',
                  child: Text('00FF00'),
                ),
                DropdownMenuItem(
                  value: '7DFF7D',
                  child: Text('7DFF7D'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  green = value!;
                });
              },
            ),
            // "DropdownButton"-widget'et lader brugeren vælge en hexadecimal værdi for blå farve
            DropdownButton<String>(
              value: blue,
              items: const [
                DropdownMenuItem(
                  value: '7D7DFF',
                  child: Text('7D7DFF'),
                ),
                DropdownMenuItem(
                  value: '3E3EFF',
                  child: Text('3E3EFF'),
                ),
                DropdownMenuItem(
                  value: '0000FF',
                  child: Text('0000FF'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  blue = value!;
                });
              },
            ),
            // ElevatedButton er en knap, der bruges til at indsende data
            ElevatedButton(
              // onPressed er en callback-funktion, der bliver kaldt, når brugeren trykker på knappen
              onPressed: () {
                // Navigator.push bruges til at navigere til en ny side i appen
                Navigator.push(
                  context,
                  // MaterialPageRoute definerer den nye side, der bliver vist
                  MaterialPageRoute(
                    builder: (context) => MainPage(
                      // Color.fromRGBO bruges til at oprette en farve ud fra en RGB-værdi
                      color: Color.fromRGBO(
                        int.parse(red, radix: 16),
                        int.parse(green, radix: 16),
                        int.parse(blue, radix: 16),
                        1.0,
                      ),
                      // name og selectedAnimal er argumenter, der sendes til den nye side
                      name: widget.initialName,
                      selectedAnimal: widget.selectedAnimal,
                    ),
                  ),
                );
              },
              // child definerer teksten, der vises på knappen
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
