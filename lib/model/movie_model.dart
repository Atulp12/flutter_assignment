import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class MovieModel {
  final String id;
  final String name;
  String genre;
  String rating;
  final String image;

  MovieModel({required this.id, required this.name, required this.image,  this.genre = '', this.rating = ''});
  

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imdbID': id,
      'Title': name,
      'Genre': genre,
      'imdbRating': rating,
      'Poster': image,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
  return MovieModel(
    id: map['imdbID'] as String? ?? "", 
    name: map['Title'] as String? ?? "Unknown", 
    genre: map['Genre'] as String? ?? "Unknown", 
    rating: map['imdbRating'] as String? ?? "N/A", 
    image: map['Poster'] as String? ?? "https://via.placeholder.com/150", 
  );
}

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
