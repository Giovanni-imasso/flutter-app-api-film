import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/film_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<FilmProvider>(context, listen: false)
        .fetchFilms("Harry Potter");
  }

  @override
  Widget build(BuildContext context) {
    final filmProvider = Provider.of<FilmProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              filmProvider.fetchFilms(_searchController.text.isEmpty
                  ? "Harry Potter"
                  : _searchController.text);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(labelText: 'Search'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    filmProvider.fetchFilms(_searchController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filmProvider.filteredFilms.length,
              itemBuilder: (context, index) {
                final film = filmProvider.filteredFilms[index];
                //debugPrint('Film: ${film.title}');
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('[$index] ${film.title}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
