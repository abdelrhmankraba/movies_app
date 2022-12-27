import 'package:flutter/material.dart';
import 'package:movies_app/tvs_modules/presentation/component/popular_component_tv.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent.withOpacity(0.8),
        title: const Text(
          'Popular Tvs',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: const PopularDetailsScreenTv(),
    );
  }
}
