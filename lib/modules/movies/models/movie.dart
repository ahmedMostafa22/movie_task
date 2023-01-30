import 'package:alpha/constants/network_consts.dart';

class Movie {
  final String id, title, image, year;

  Movie(this.id, this.title, this.image, this.year);

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      json['id'].toString(),
      json['title'],
      json['backdrop_path'],
      json['release_date'].toString().substring(0, 4));

  Map<String, dynamic> toMap() =>
      {'id': id, 'title': title, 'backdrop_path': image, 'release_date': year};
}
