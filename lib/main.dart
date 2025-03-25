import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/theme/app_theme.dart';
import 'package:flutter_assignment/repository/movie_repository.dart';
import 'package:flutter_assignment/viewmodel/movie_viewmodel.dart';
import 'package:flutter_assignment/views/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => MovieRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieViewmodel(
            movieRepository: context.read<MovieRepository>(),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}
