import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState(); // Si no no podemos usar ref
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    // Usando los providers de riverpod.
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    // final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final moviesSlideShow = ref.watch( moviesSlideshowProvider );

    if ( moviesSlideShow.isEmpty ) {
      return const Center(
        child: CircularProgressIndicator( strokeWidth: 2 ),
      );
    }

    return Column(
      children: [
        const CustomAppbar(),
        const SizedBox( height: 10 ),
        MoviesSlideshow(movies: moviesSlideShow),
      ],
    );
  }
}