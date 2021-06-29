import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/bloc/movies/movies_bloc.dart';
import 'package:movie_app/bloc/movies/movies_event.dart';
import 'package:movie_app/bloc/movies/movies_state.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/screens/search_screen1.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/app_icon_button.dart';
import 'package:movie_app/widgets/app_image.dart';

import '../widgets/app_sized_box.dart';
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
      if (state is MoviesStateFailed) return AppText(text: state.error);

      /// displaying progress
      return buildProgressWidget();
    }));
  }

  Widget _buildListData(List<Movie> list) {
    movies = list;
    Movie movie = movies[backgroundIndex];
    return Stack(
      children: [appImage(movie.poster), buildBody(movies[backgroundIndex])],
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
              buildMovieText(movie.title, movie.rate, movie.overview),
            ],
          )),
    );
  }

  Widget buildPager(int page) {
    return InkWell(
      onTap: () {
        print('Movie:${movies[backgroundIndex]}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movies[backgroundIndex])));
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

Widget buildToolbar(String text, IconData icon, BuildContext context,) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.w),
    child: Row(
      children: [
        AppSizedBox(width: 40.w),
        AppText(text: text, color: Colors.white, textSize: 25.sp, fontWeight: FontWeight.bold),
        PopupMenuButton<int>(
          icon:Icon(Icons.arrow_drop_down_rounded) ,
            color:Colors.black38 ,
            onSelected:(item)=> _onSelect(context: context,item: item),
            itemBuilder: (context)=>[
              appPopupMenuItem(v:0,text: 'Popular'),
              appPopupMenuItem(v: 1,text: 'Top Rated'),
              appPopupMenuItem(v:2,text: 'Now Playing'),
              appPopupMenuItem(v:3,text: 'Upcoming'),
            ]),
        Spacer(),
        AppIconButton(
            press: ()=> Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen1())),
            icon: Icons.search),
        AppSizedBox(width: 20.w),
      ],
    ),
  );
}

_onSelect({required BuildContext context, required int item}) {
  switch(item){
    case 0:
      selectedItem = 'popular';
      print('selectedItem----------$selectedItem');
      break;
    case 1:
      selectedItem = 'top_rated';

      break;
    case 2:
      selectedItem = 'now_playing';
      break;
    case 3:
      selectedItem = 'upcoming';
      break;

  }

}

PopupMenuItem<int> appPopupMenuItem({required int v,required String text}) =>
    PopupMenuItem(value:v,child: AppText(text: text));
