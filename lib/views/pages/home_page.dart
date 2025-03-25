import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/theme/app_color.dart';
import 'package:flutter_assignment/viewmodel/movie_viewmodel.dart';
import 'package:flutter_assignment/views/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppColor.lightGreyColor,
        forceMaterialTransparency: true,
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                contentPadding: const EdgeInsets.all(10),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<MovieViewmodel>().searchMovies(value);
                }
              },
            ),
          ),
        ),
      ),
      body: Consumer<MovieViewmodel>(
        builder: (context, value, child) {
          final viewModel = context.read<MovieViewmodel>();
          return viewModel.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: viewModel.movies.isEmpty
                          ? Center(
                              child: Text("Search movies by name!!"),
                            )
                          : ListView.builder(
                            itemCount: viewModel.movies.length,
                              itemBuilder: (context, i) {
                                final movies = viewModel.movies;
                                return MovieCard(
                                  name: movies[i].name,
                                  image: movies[i].image,
                                  genre: movies[i].genre,
                                  ratings: movies[i].rating,
                                );
                              },
                            ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
