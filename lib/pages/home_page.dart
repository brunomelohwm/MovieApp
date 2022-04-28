import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = HomeController();
    controller.tabela = controller.getList();

    //print(controller.tabela);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 110,
            right: 220,
            child: Text(
              'Os Mais Populares',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(244, 0, 0, 0),
              ),
            ),
          ),
          //Text('Os Mais Populares'),
          Positioned(
            width: 110,
            top: 140,
            right: 20,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3rieja2Lwo5vW7jP9fYEGuRuYPu.jpg'),
          ),
          Positioned(
            width: 110,
            top: 140,
            left: 20,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cg93jYwHiDVkesAkllPfeiO6brm.jpg'),
          ),
          Positioned(
            width: 110,
            top: 140,
            left: 140,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dSrD6Tkn4UgW7slML7wDYZlu9kA.jpg'),
          ),
          Positioned(
            bottom: 110,
            right: 220,
            height: 210,
            child: Text(
              'Grátis Para Assistir',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(244, 0, 0, 0),
              ),
            ),
          ),
          Positioned(
            width: 110,
            bottom: 120,
            left: 20,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hdkEJ3lYF89WSDNF6iC69E2MoJr.jpg'),
          ),
          Positioned(
            width: 110,
            bottom: 120,
            right: 140,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wd7b4Nv9QBHDTIjc2m7sr0IUMoh.jpg'),
          ),
          Positioned(
            width: 110,
            bottom: 120,
            right: 20,
            child: Image.network(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jqCR5YCEDgBMEHjcMdkfh2zha6N.jpg'),
          ),
        ],
      ),
    );

    // child: Image.network(tabela[i].posterPath!),
  }
}
