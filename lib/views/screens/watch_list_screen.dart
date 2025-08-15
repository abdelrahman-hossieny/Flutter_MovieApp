import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/controllers/bookmark_controller.dart';
import 'package:movies/models/movie_model.dart';
import 'package:provider/provider.dart';

import '../widgets/list_movie_item_widget.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: TextStyle(color: AppColors.primaryTextColor),
        ),
        backgroundColor: AppColors.BackgroundColor,
      ),
      body: Consumer<BookmarkController>(
        builder: (BuildContext context, BookmarkController controller, Widget? widget) {
          return ListView.builder(
            itemCount: controller.bookmarksList.length,
            itemBuilder: (BuildContext context, int index) {
              final MovieModel item = controller.bookmarksList[index];
              return ListMovieItemWidget(item: item);
            },
          );
        },
      ),
    );
  }
}