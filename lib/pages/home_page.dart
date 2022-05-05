import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movies_app/models/widgets/popular.dart';
import '../models/widgets/now_playing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List popularityMovies = [];
  List nowPlayingMovies = [];
  // List tv = [];

  final String apikey = '1f0eff93de7c467191931ae3861e556b';
  final readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZjBlZmY5M2RlN2M0NjcxOTE5MzFhZTM4NjFlNTU2YiIsInN1YiI6IjYyNjg2NGQyMWY5OGQxMDA5YWQ4OTIwOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ifq8ly9pb1cnIPRCWkNIwuGQcLpiOcbFhWZyjuWgYCk7';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccestoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map popularityResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map nowPlayingResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    //Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      popularityMovies = popularityResult['results'];
      nowPlayingMovies = nowPlayingResult['results'];
    });
    // ignore: avoid_print
    print(nowPlayingResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const ModText(
          text: 'Flutter Movie App',
          color: Colors.black,
          size: 18,
        ),
      ),
      body: ListView(
        children: [
          Popularity(popularity: popularityMovies),
          NowPlayingMovies(nowPlaying: nowPlayingMovies),
        ],
      ),
    );
  }
}
