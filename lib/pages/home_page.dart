import 'package:flutter/material.dart';
import 'package:movies_app/data_source/fetch_movies_datasource.dart';
import 'package:movies_app/pages/widgets/card_movie_widget.dart';

import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 5, top: 50),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: const Text(
                    'Os Mais Populares',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                FutureBuilder<List<MovieModel>>(
                  future: FetchMoviesDataSource.getMoviesPopular(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final movie = snapshot.data![index];
                            return CardMovieWidget(movie: movie);
                          },
                        ),
                      );
                    }
                    if (snapshot.hasError) {}
                    return const CircularProgressIndicator();
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: const Text(
                    'Grátis Para Assistir',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                FutureBuilder<List<MovieModel>>(
                  future: FetchMoviesDataSource.getMoviesFreeToWatch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final movie = snapshot.data![index];
                            return CardMovieWidget(movie: movie);
                          },
                        ),
                      );
                    }
                    if (snapshot.hasError) {}
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
