import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../models/trending.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

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
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // ignore: avoid_print
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    var controller = HomeController();
    controller.tabela = controller.getList();

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
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
