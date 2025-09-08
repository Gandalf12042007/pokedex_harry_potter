import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final dynamic character;

  const DetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name'] ?? "Desconhecido"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: character['image'] != null && character['image'] != ""
                  ? Image.network(character['image'], height: 200)
                  : const Icon(Icons.person, size: 100),
            ),
            const SizedBox(height: 20),
            Text("Nome: ${character['name']}", style: const TextStyle(fontSize: 18)),
            Text("Casa: ${character['house'] ?? 'N/A'}"),
            Text("Espécie: ${character['species'] ?? 'N/A'}"),
            Text("Patrono: ${character['patronus'] ?? 'N/A'}"),
            Text("Ator: ${character['actor'] ?? 'N/A'}"),
          ],
        ),
      ),
    );
  }
}
