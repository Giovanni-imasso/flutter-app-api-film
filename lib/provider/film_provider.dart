import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/film.dart';
import 'package:http/http.dart' as http;

class FilmProvider with ChangeNotifier {
  List<Film> _films = [];

  List<Film> _filteredFilms = [];
  List<Film> get filteredFilms => _filteredFilms;

  Future<void> fetchFilms(String query) async {
    final String apiUrl = "http://www.omdbapi.com/?apikey=600757c3&s=$query";

    try {
      // prendo la risposta da http.get
      // se la connesssione è 200 allora prendo il body del json
      // metto tutto dentro la variabile films e la trasformo in una lista di film

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);

        debugPrint("body: $body");
        final List<dynamic> search = body['Search'] ?? [];

        _films = search.map((filmJson) => Film.fromJson(filmJson)).toList();
        _filteredFilms = _films;

        notifyListeners();
      } else {
        throw Exception("Failed to load films");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
