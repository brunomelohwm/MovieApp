// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../utils/text.dart';

class Popularity extends StatelessWidget {
  final List popularity;
  const Popularity({Key? key, required this.popularity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModText(
              text: 'Os Mais Populares', color: Colors.black, size: 18),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              itemCount: popularity.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      popularity[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: ModText(
                            text: popularity[index]['title'] != null
                                ? popularity[index]['title']
                                : 'Carregando',
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: ModText(
                            text: popularity[index]['release_date'] != null
                                ? popularity[index]['release_date']
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
