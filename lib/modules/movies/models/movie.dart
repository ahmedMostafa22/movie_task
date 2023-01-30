class Movie {
  final String id, name, image,rate,year;

  Movie(this.id, this.name, this.image, this.rate, this.year);

factory Movie.fromJson(Map<String, dynamic>json)=>Movie(json['id'],json ['name'],json ['image'],json ['rate'], json['year']);
}
