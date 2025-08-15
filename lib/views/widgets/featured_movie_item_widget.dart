// import 'package:flutter/material.dart';
// import 'package:movies/helpers/themes/app_colors.dart';
// import 'package:movies/models/movie_model.dart';
//
// class FeaturedMovieItemWidget extends StatelessWidget {
//   final MovieModel item;
//   const FeaturedMovieItemWidget({super.key ,required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 16,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(item.image,fit: BoxFit.cover,height: 340,width: 240,)),
//         Text(item.title ,style: TextStyle(color: AppColors.primaryTextColor , fontWeight: FontWeight.w500 ,  fontSize: 16 ),)
//       ],
//     );
//   }
// }
//**************************************************************************
// *************************************************************************

import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/views/screens/movie_details_screen.dart';

class FeaturedMovieItemWidget extends StatelessWidget {
  final MovieModel item;
  const FeaturedMovieItemWidget({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: item),
          ),
        );
      },
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(item.image,fit: BoxFit.cover,height: 340,width: 240,)),
          Text(item.title ,style: TextStyle(color: AppColors.primaryTextColor , fontWeight: FontWeight.w500 ,  fontSize: 16 ),)
        ],
      ),
    );
  }
}