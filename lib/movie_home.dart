import 'package:flutter/material.dart';
import 'package:movie_app/widgets/text.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List trending = [];
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = 'd9c29321c1fd8a69d6a3511a92542407';
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWMyOTMyMWMxZmQ4YTY5ZDZhMzUxMWE5MjU0MjQwNyIsInN1YiI6IjYzMDhjZjZhYzM5MjY2MDA3YWM4YWQ0ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tq3ABa2_CIKsIm4wHHisBYKhiUqqoWn97vKAOg7FDv8';

  initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(apiKey, accessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
    )
    );

    Map trendingResult = await tmdbWithCustomlogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomlogs.v3.tv.getTopRated();
    Map tvResult = await tmdbWithCustomlogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];

      print(topRatedMovies);

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        bottomOpacity: 20,
        title: ModifiedText(text: 'Movie App',),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.black45,
       child: ListView(
          children: [
            TvShow(tvShow: tv,),
            TopRated(topRated: topRatedMovies,),
            TrendingMovies(trending:trendingMovies),
          ],
        ),

      )
    );
  }
}
