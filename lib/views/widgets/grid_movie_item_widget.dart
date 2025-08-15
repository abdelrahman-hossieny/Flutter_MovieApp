// import 'package:flutter/material.dart';
// import 'package:movies/helpers/themes/app_colors.dart';
// import 'package:movies/models/movie_model.dart';
// import 'package:movies/controllers/bookmark_controller.dart';
// import 'package:provider/provider.dart';
//
// class GridMovieItemWidget extends StatefulWidget {
//   final MovieModel item;
//   const GridMovieItemWidget({super.key, required this.item});
//
//   @override
//   State<GridMovieItemWidget> createState() => _GridMovieItemWidgetState();
// }
//
// class _GridMovieItemWidgetState extends State<GridMovieItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   widget.item.image,
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       widget.item.isBookmarked = !widget.item.isBookmarked;
//                     });
//
//                     if (widget.item.isBookmarked) {
//                       Provider.of<BookmarkController>(context, listen: false).addBookmark(widget.item);
//                     } else {
//                       Provider.of<BookmarkController>(context, listen: false).removeBookmark(widget.item);
//                     }
//                   },
//                   icon: Icon(
//                     widget.item.isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
//                     color: widget.item.isBookmarked ? Colors.red : Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           widget.item.title,
//           style: const TextStyle(
//             color: AppColors.primaryTextColor,
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//           ),
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//   }
// }

//=============================================================================
//===========================================================================


import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/controllers/bookmark_controller.dart';
import 'package:movies/views/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

class GridMovieItemWidget extends StatefulWidget {
  final MovieModel item;
  const GridMovieItemWidget({super.key, required this.item});

  @override
  State<GridMovieItemWidget> createState() => _GridMovieItemWidgetState();
}

class _GridMovieItemWidgetState extends State<GridMovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: widget.item),
          ),
        );
      },
      child: Consumer<BookmarkController>(
        builder: (context, bookmarkController, child) {
          // تحديث حالة الـ bookmark من الـ controller
          bool isBookmarked = bookmarkController.bookmarksList.contains(widget.item);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.item.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          // Prevent navigation when bookmark is tapped
                        },
                        child: IconButton(
                          onPressed: () {
                            if (isBookmarked) {
                              Provider.of<BookmarkController>(context, listen: false).removeBookmark(widget.item);
                            } else {
                              Provider.of<BookmarkController>(context, listen: false).addBookmark(widget.item);
                            }
                          },
                          icon: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
                            color: isBookmarked ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.item.title,
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}


