// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/text.dart';

class NowPlayingMovies extends StatelessWidget {
  final List nowPlaying;
  const NowPlayingMovies({
    Key? key,
    required this.nowPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModText(text: 'Grátis Para Assistir', color: Colors.black, size: 18),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: nowPlaying.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowPlaying[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: ModText(
                            text: nowPlaying[index]['title'] != null
                                ? nowPlaying[index]['title']
                                : 'Carregando',
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: ModText(
                            text: nowPlaying[index]['release_date'] != null
                                ? nowPlaying[index]['release_date']
                                : 'Carregando',
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
