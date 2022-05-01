import '../models/movie.dart';

class HomeController {
  List tabela = [];

  List<Movie> getList() {
    final tabela = [
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3rieja2Lwo5vW7jP9fYEGuRuYPu.jpg',
        name: 'Melancholia',
        voteAverage: '72',
        releaseDate: '11/11/2011',
      ),
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dSrD6Tkn4UgW7slML7wDYZlu9kA.jpg',
        name: 'A Ghost Story',
        voteAverage: '71',
        releaseDate: '07/07/2017',
      ),
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hdkEJ3lYF89WSDNF6iC69E2MoJr.jpg',
        name: 'The Professor',
        voteAverage: '68',
        releaseDate: '01/08/2019',
      ),
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jqCR5YCEDgBMEHjcMdkfh2zha6N.jpg',
        name: 'kimi no na wa',
        voteAverage: '100',
        releaseDate: '03/03/2017',
      ),
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cg93jYwHiDVkesAkllPfeiO6brm.jpg',
        name: 'Chappie',
        voteAverage: '75',
        releaseDate: '05/06/2014',
      ),
      Movie(
        posterPath:
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wd7b4Nv9QBHDTIjc2m7sr0IUMoh.jpg',
        name: 'The Batman',
        voteAverage: '85',
        releaseDate: '02/02/2022',
      ),
    ];
    return tabela;
  }
}
