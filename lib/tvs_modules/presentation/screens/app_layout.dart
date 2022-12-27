import 'package:flutter/material.dart';
import 'package:movies_app/movies_modules/presentation/screens/movies_screen.dart';
import 'package:movies_app/tvs_modules/presentation/screens/tv_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Widget> screens = [
    const MoviesScreen(),
    const TvScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff12131C),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie), label: '', tooltip: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.tv), label: '', tooltip: 'Tvs'),
        ],
      ),
    );
  }
}
