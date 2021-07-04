import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/movies/movies_bloc.dart';
import 'package:movie_app/bloc/movies/movies_event.dart';
import 'package:movie_app/bloc/movies/movies_state.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/model/movie.dart';

import 'package:movie_app/widgets/app_image.dart';
import 'package:movie_app/widgets/home_screen_app_bar.dart';
import 'package:movie_app/widgets/navigate_to.dart';

import '../widgets/index.dart';
import '../widgets/build_text.dart';
import '../model/movie.dart';
import '../widgets/movie_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String selectedItem = 'now_playing';

class _HomeState extends State<Home> {
  final PageController pageController = PageController(viewportFraction: .8, initialPage: 0);

  List<Movie> movies = [];

  int backgroundIndex = 0;

  void fun() => {};
  @override
  void initState() {
    pageController.addListener(fun);
    MoviesBloc()..add(MoviesEventFetch(selectedItem: selectedItem));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('selectedItem----------$selectedItem');
    return BlocProvider(
      create: (_) => MoviesBloc()..add(MoviesEventFetch(selectedItem: selectedItem)),
      child: _buildBody(),
    );
  }

  Scaffold _buildBody() {
    return Scaffold(body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      /// displaying data
      if (state is MoviesStateSuccess) return _buildListData(state.list);
      if (state is MoviesStateFailed) return Center(child:
      AppText(
        text: 'Check your connection!',
        color: Colors.black)
      );

      /// displaying progress
      return buildProgressWidget();
    }));
  }

  Widget _buildListData(List<Movie> list) {
    movies = list;
    Movie movie = movies[backgroundIndex];
    return Stack(
      children: [appImage(movie.poster!), buildBody(movies[backgroundIndex])],
    );
  }

  Widget buildBody(Movie movie) {
    return SingleChildScrollView(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            children: [
              AppSizedBox(height: 50.h),
              buildToolbar('Top Rated', Icons.search, context),
              buildPager(backgroundIndex),
              buildMovieText(movie.title ?? '', movie.rating ?? '', movie.overview ?? ''),
            ],
          )),
    );
  }

  Widget buildPager(int page) {
    return InkWell(
      onTap: () {
        print('Movie:${movies[backgroundIndex]}');
       navigateTo(context,DetailScreen(movies[backgroundIndex]));
      },
      child: Container(
        height: .6.sh,
        child: PageView.builder(
          onPageChanged: (pageIndex) {
            setState(() {
              backgroundIndex = pageIndex;
            });
          },
          controller: pageController,
          itemBuilder: (context, index) => MovieCard(movies[index]),
          itemCount: movies.length,
        ),
      ),
    );
  }

  Widget buildMovieText(String movieName, String rate, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              AppSizedBox(width: 20.w),
              Expanded(
                flex: 9,
                child: AppText(
                  text: movieName,
                  fontWeight: FontWeight.bold,
                  textSize: 20.sp,
                ),
              ),
              Spacer(),
              AppText(
                text: rate,
                fontWeight: FontWeight.bold,
                textSize: 20.sp,
              ),
              AppText(
                text: '/10',
                textSize: 20.sp,
                color: Colors.white.withOpacity(.5),
              ),
              AppSizedBox(width: 20.w),
            ],
          ),
          AppSizedBox(height: 20.h),
          Container(margin: EdgeInsets.only(left: 20, right: 20), child: AppText(text: description))
        ],
      ),
    );
  }
}

Center buildProgressWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

