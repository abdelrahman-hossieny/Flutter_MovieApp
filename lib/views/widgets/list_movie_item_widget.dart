import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/controllers/bookmark_controller.dart';
import 'package:provider/provider.dart';

class ListMovieItemWidget extends StatelessWidget {
  final MovieModel item;

  const ListMovieItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item.image,
            width: 60,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${item.releaseDate.year}',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              item.rating.toString(),
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.bookmark,
          color: Colors.amber,
        ),
      ),
    );
  }
}