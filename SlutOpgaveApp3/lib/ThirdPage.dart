import 'package:flutter/material.dart';
import 'package:slutopgavehentnavnogfarve/main.dart';

class ThirdPage extends StatefulWidget {
  final updateData;
  final Animals initialAnimals;
  final String initialName;
  final String animalName;
  final Animals selectedAnimal;
  Animals selectedAnimals;

  ThirdPage({
    this.updateData,
    required this.initialAnimals,
    required this.initialName,
    required this.animalName,
    required this.selectedAnimal,
  }) : selectedAnimals = selectedAnimal;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String red = 'FF0000';
  String green = '00FF00';
  String blue = '0000FF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onChanged: (value) {
                setState(() {
                  red = value!;
                });
              },
            ),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(
                      color: Color.fromRGBO(
                        int.parse(red, radix: 16),
                        int.parse(green, radix: 16),
                        int.parse(blue, radix: 16),
                        1.0,
                      ),
                      name: widget.initialName,
                      selectedAnimal: widget.selectedAnimal,
                    ),
                  ),
                );
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
