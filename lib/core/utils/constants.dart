class Constants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String apiKey = 'c3435cfe40aeb079689227d82bf921d3';

  static const String nowPlayingMoviesPth =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPth =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPth =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String onTheAirTvPth = '$baseUrl/tv/on_the_air?api_key=$apiKey';

  static const String popularTvPth = '$baseUrl/tv/popular?api_key=$apiKey';
  static const String toRatedTvPth = '$baseUrl/tv/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
