import 'package:flutter/material.dart';

class RenderCard extends StatelessWidget {
  const RenderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 03,
      semanticContainer: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3rieja2Lwo5vW7jP9fYEGuRuYPu.jpg',
              width: 140,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ), //fit: BoxFit.contain,
    );
  }
}
