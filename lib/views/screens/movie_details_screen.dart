import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/controllers/bookmark_controller.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie poster with back button and bookmark
            _buildMoviePoster(context),

            // Movie details content
            _buildMovieDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviePoster(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      child: Stack(
        children: [
          // Movie poster background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.movie.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.BackgroundColor.withOpacity(0.3),
                  AppColors.BackgroundColor,
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),

          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),
                shape: CircleBorder(),
              ),
            ),
          ),

          // Bookmark button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 16,
            child: IconButton(
              onPressed: () {
                setState(() {
                  widget.movie.isBookmarked = !widget.movie.isBookmarked;
                });

                if (widget.movie.isBookmarked) {
                  Provider.of<BookmarkController>(context, listen: false).addBookmark(widget.movie);
                } else {
                  Provider.of<BookmarkController>(context, listen: false).removeBookmark(widget.movie);
                }
              },
              icon: Icon(
                widget.movie.isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
                color: widget.movie.isBookmarked ? Colors.red : Colors.white,
                size: 28,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDetails() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie title
          Text(
            widget.movie.title,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          // Release date
          Text(
            'Release Date: ${widget.movie.releaseDate.year}-${widget.movie.releaseDate.month.toString().padLeft(2, '0')}-${widget.movie.releaseDate.day.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: AppColors.secondTextColor,
              fontSize: 16,
            ),
          ),

          SizedBox(height: 20),

          // Rating
          Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.yellowColor,
                size: 24,
              ),
              SizedBox(width: 8),
              Text(
                widget.movie.rating.toString(),
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '/10',
                style: TextStyle(
                  color: AppColors.secondTextColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          SizedBox(height: 24),

          // Description
          Text(
            widget.movie.desc,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

//=================================================================================

// class MovieDetailsScreen extends StatefulWidget {
//   final MovieModel movie;
//
//   const MovieDetailsScreen({super.key, required this.movie});
//
//   @override
//   State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
// }
//
// class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.BackgroundColor,
//       body: Column(
//         children: [
//           // Top section with movie poster
//           _buildTopSection(context),
//
//           // Bottom section with movie info
//           _buildBottomSection(),
//         ],
//       ),
//     );
//   }
//
//   // Top section with movie image and navigation buttons
//   Widget _buildTopSection(BuildContext context) {
//     return Container(
//       height: 400,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           // Movie image
//           Image.asset(
//             widget.movie.image,
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//
//           // Dark overlay for better text visibility
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.black.withOpacity(0.3),
//           ),
//
//           // Navigation buttons (back and bookmark)
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Back button
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   ),
//
//                   // Bookmark button
//                   IconButton(
//                     onPressed: () {
//                       // Toggle bookmark status
//                       widget.movie.isBookmarked = !widget.movie.isBookmarked;
//                       setState(() {});
//
//                       // Add or remove from bookmark list
//                       if (widget.movie.isBookmarked) {
//                         Provider.of<BookmarkController>(context, listen: false)
//                             .addBookmark(widget.movie);
//                       } else {
//                         Provider.of<BookmarkController>(context, listen: false)
//                             .removeBookmark(widget.movie);
//                       }
//                     },
//                     icon: Icon(
//                       widget.movie.isBookmarked
//                           ? Icons.bookmark
//                           : Icons.bookmark_border,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Bottom section with movie details
//   Widget _buildBottomSection() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Movie title
//             Text(
//               widget.movie.title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             SizedBox(height: 12),
//
//             // Release date
//             Text(
//               'Release Date: ${widget.movie.releaseDate.year}',
//               style: TextStyle(
//                 color: AppColors.secondTextColor,
//                 fontSize: 16,
//               ),
//             ),
//
//             SizedBox(height: 16),
//
//             // Rating with star icon
//             Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: AppColors.yellowColor,
//                   size: 24,
//                 ),
//                 SizedBox(width: 8),
//                 Text(
//                   '${widget.movie.rating}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '/10',
//                   style: TextStyle(
//                     color: AppColors.secondTextColor,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             // Movie description
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   widget.movie.desc,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }