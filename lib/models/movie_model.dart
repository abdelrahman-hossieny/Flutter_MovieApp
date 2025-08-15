class MovieModel {
  final String title;
  final String desc;
  final double rating;
  final DateTime releaseDate;
  final String image;
   bool isBookmarked;
  final bool isFeatured;

  MovieModel({
    required this.title,
    required this.desc,
    required this.rating,
    required this.releaseDate,
    required this.image,
    required this.isBookmarked,
    required this.isFeatured,
  });

  // إضافة copyWith method لتغيير القيم
  MovieModel copyWith({
    String? title,
    String? desc,
    double? rating,
    DateTime? releaseDate,
    String? image,
    bool? isBookmarked,
    bool? isFeatured,
  }) {
    return MovieModel(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
      image: image ?? this.image,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  static List<MovieModel> getFakeMovies() {
    final List<MovieModel> movies = [];

    final List<Map<String, dynamic>> movieData = [
      {"title": "12th Fail", "image": "assets/images/12th _Fail_Movie.jpg"},
      {"title": "Breaking Bad", "image": "assets/images/Breaking_Bad.jpg"},
      {"title": "Dangal", "image": "assets/images/Dangal.jpg"},
      {"title": "The Covenant", "image": "assets/images/The_Conenant.jpg"},
      {"title": "Extraction 2", "image": "assets/images/Extraction_2.jpg"},
      {"title": "Extraction", "image": "assets/images/EXTRACTION.jpg"},
      {"title": "Seven", "image": "assets/images/Seven.jpg"},
      {"title": "Fury", "image": "assets/images/Fury.jpg"},
      {"title": "Gene Takavic", "image": "assets/images/Gene_Takavic.jpg"},
      {"title": "God Father", "image": "assets/images/God_Father.jpg"},
      {"title": "Game of Thrones", "image": "assets/images/GOT.jpg"},
      {"title": "Super 30", "image": "assets/images/Super_30.jpg"},
      {"title": "Interstellar", "image": "assets/images/Interstellar.jpg"},
      {"title": "John Wick", "image": "assets/images/john_wick.jpg"},
      {"title": "Mad Max Fury Road", "image": "assets/images/Mad_Max_Fury_Road.jpg"},
      {"title": "Prison Break", "image": "assets/images/prison_break.jpg"},
      {"title": "The Shawshank Redemption", "image": "assets/images/THE_SHAWSHANK_REDEMPTION.jpg"},
      {"title": "Top Gun Maverick", "image": "assets/images/Top_Gun_Maverick.jpg"},
    ];

    final List<String> descriptions = [
      "A thrilling crime drama that will keep you on the edge of your seat.",
      "An inspiring story of determination and never giving up on dreams.",
      "The greatest crime series ever made about power, family and consequences.",
      "A heartwarming story of a father's love and wrestling championship.",
      "An intense military action thriller with brotherhood and sacrifice.",
      "High-octane action sequel with spectacular fight sequences.",
      "Non-stop action movie with incredible stunts and rescue missions.",
      "A gritty World War II tank crew fighting their way through enemy territory.",
      "A character-driven drama about identity and survival.",
      "The ultimate crime saga about family, power, and the American Dream.",
      "Epic fantasy series with dragons, politics, and unforgettable characters.",
      "Inspiring biographical drama about education and social change.",
      "A mind-bending sci-fi masterpiece about love, time, and space exploration.",
      "Stylish action thriller about revenge and the criminal underworld.",
      "Post-apocalyptic action adventure with stunning visuals and car chases.",
      "Gripping prison drama series about escape, brotherhood, and conspiracy.",
      "Uplifting drama about hope, friendship, and redemption behind bars.",
      "High-flying action sequel with incredible aerial sequences and nostalgia."
    ];

    for (int i = 0; i < movieData.length; i++) {
      final double rating = 7.0 + (i % 30) / 10; // Ratings between 7.0-10.0
      final DateTime releaseDate = DateTime(2015 + (i % 8), 1 + (i % 12), 1 + (i % 28));
      final bool isFeatured = i % 4 == 0; // Every fourth movie is featured

      movies.add(
          MovieModel(
            title: movieData[i]["title"],
            desc: descriptions[i],
            rating: rating,
            releaseDate: releaseDate,
            image: movieData[i]["image"],
            isBookmarked: false,
            isFeatured: isFeatured,
          )
      );
    }

    return movies;
  }
}