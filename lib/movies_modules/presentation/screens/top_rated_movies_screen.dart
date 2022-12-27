import 'package:flutter/material.dart';
import 'package:movies_app/movies_modules/presentation/component/top_rated_component.dart';

class TopRatedMoviesScreen extends StatelessWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent.withOpacity(0.8),
        title: const Text(
          'Top Rated Movies',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: const TopRatedDetailsComponent(),
    );
  }
}
