import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

class BookmarkController extends ChangeNotifier {
  List<MovieModel> bookmarksList = [];

  void addBookmark(MovieModel movie) {
    if (!bookmarksList.contains(movie)) {
      bookmarksList.add(movie);
      notifyListeners();
    }
  }

  void removeBookmark(MovieModel movie) {
    bookmarksList.remove(movie);
    notifyListeners();
  }
}