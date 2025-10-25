import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only( top: 0 ),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary.withAlpha(100),
          )
        ),
        itemBuilder: ( context, index ) {
          return _Slide(movie: movies[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 5)
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only( bottom: 30 ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            loadingBuilder: ( context, child, loadingProgress ) {
              if ( loadingProgress == null ) return FadeIn( child: child );

              return const Center(
                child: CircularProgressIndicator( strokeWidth: 2 ),
              );
            },
          ),
        ),
      ),
    );
  }
}