import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final dynamic character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: character['image'] != null && character['image'] != ""
            ? CircleAvatar(backgroundImage: NetworkImage(character['image']))
            : const CircleAvatar(child: Icon(Icons.person)),
        title: Text(character['name'] ?? "Sem Nome"),
        subtitle: Text(character['house'] ?? "Sem Casa"),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
