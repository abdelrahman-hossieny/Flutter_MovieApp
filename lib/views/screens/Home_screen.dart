import 'package:flutter/material.dart';
import 'package:movies/helpers/themes/app_colors.dart';
import 'package:movies/models/movie_model.dart';

import '../widgets/featured_movie_item_widget.dart';
import '../widgets/grid_movie_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final List<MovieModel> moviesList = MovieModel.getFakeMovies();
  static final List<MovieModel> featuredList = moviesList.where((e)  => e.isFeatured).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(title: Text("Movie Catalog", style: TextStyle(color: AppColors.primaryTextColor),), backgroundColor: AppColors.BackgroundColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            _searchBar(),
            SizedBox(height: 10,),

            // Featured List
            _featuredList(),
            SizedBox(height: 10,),

            // All Movies Header
            _allMoviesHeader(),

            // All Movies Grid
            _allMOviesList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.secondTextColor),
          prefixIcon: Icon(Icons.search , color: AppColors.secondTextColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
  Widget _featuredList() {

    return Container(
      height: 380,
      padding: const EdgeInsets.only(left: 16),
      child: ListView.separated(
        itemCount: featuredList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final MovieModel item = featuredList[index];
          return FeaturedMovieItemWidget(item: item);
        },
      ), // ListView.separated
    ); // Container
  }
  Widget _allMoviesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "All Movies",
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _allMOviesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),

      child: GridView.builder(
          itemCount: moviesList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              crossAxisSpacing: 12,
            mainAxisSpacing: 22
          ),
          itemBuilder: (context, index) {
            final MovieModel item = moviesList[index];
            return GridMovieItemWidget(item: item);
          }
      ),
    );
  }
}