import 'package:flutter/material.dart';
import '../services/hp_api_service.dart';
import '../widgets/character_card.dart';
import 'detail_screen.dart';
import '../widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HpApiService apiService = HpApiService();
  List<dynamic> characters = [];
  List<dynamic> filtered = [];

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    final data = await apiService.fetchCharacters();
    setState(() {
      characters = data;
      filtered = data;
    });
  }

  void _onSearch(String query) {
    setState(() {
      filtered = characters
          .where((char) =>
              char['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Busca de Personagens"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          CustomSearchBar(onChanged: _onSearch),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final character = filtered[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(character: character),
                      ),
                    );
                  },
                  child: CharacterCard(character: character),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
