class Film {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Film({required this.title, required this.year, required this.imdbID, required this.type, required this.poster});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['Title'] ?? 'N/A',
      year: json['Year'] ?? 'N/A',
      imdbID: json['imdbID'] ?? 'N/A',
      type: json['Type'] ?? 'N/A',
      poster: json['Poster'] ?? '',
    );
  }
}