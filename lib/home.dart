import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/detail_screen.dart';
import 'package:movie_app/movie.dart';

import 'app_sized_box.dart';
import 'build_text.dart';
import 'movie.dart';
import 'movie_card.dart';
import 'search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int backgroundIndex = 0;

class _HomeState extends State<Home> {
  PageController pageController = PageController();

  void fun() => {};

  @override
  void initState() {
    pageController = PageController(
      viewportFraction: .8,
      initialPage: 0,
    )..addListener(fun);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Movie movie = getMovie[backgroundIndex];



    return Scaffold(
        body: Stack(
      children: [
        appImage(movie.imageBlur, size),
        buildBody(size, getMovie[backgroundIndex])
      ],
    ));
  }

  Widget buildBody(Size size, Movie movie) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSizedBox(height: 50.h,),
          buildToolbar(size,'Top Rated',Icons.search,context),
          buildPager(size, backgroundIndex),
          buildMovieText(movie.name, movie.rate, size, movie.description),
        ],
      ),
    );
  }



  Widget buildPager(Size size, int page) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>DetailScreen(getMovie[backgroundIndex])));
      },
     child:Container(
        height: (size.height * .6).h,
        child: PageView.builder(
          onPageChanged: (pageIndex) {
            setState(() {
              backgroundIndex = pageIndex;
            });
          },
          controller: pageController,
          itemBuilder: (context, index) => MovieCard(getMovie[index]),
          itemCount: getMovie.length,

        ),

      ),
    );
  }

  Widget buildMovieText(
      String movieName, double rate, Size size, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              AppSizedBox(width: 20.w,),
              AppText(text: movieName, fontWeight: FontWeight.bold, textSize: 30,),
              Spacer(),
              AppText(text: rate.toString(), fontWeight: FontWeight.bold, textSize: 20,),
              AppText(text: '/10', textSize: 20, color: Colors.white.withOpacity(.5),),
              AppSizedBox(width: 20.w,),
            ],
          ),
          AppSizedBox(height: 20.h,),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: AppText(text: description))
        ],
      ),
    );
  }
}
Widget appImage(String img, Size size,) {
  return Container(
      height: size.height,
      width: size.width,
      child: Image.asset(img, fit: BoxFit.cover,));
}

Widget buildToolbar(Size size,String text,IconData icon, BuildContext context,{String data = ''}) {
  return Container(
    height: 70.h, // TODO: use screen util
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          AppSizedBox(width: 20.w,),
          AppText(text:text ,color: Colors.white,textSize: 30,fontWeight:FontWeight.bold),
           data == '' ?Icon(
             Icons.arrow_drop_down_rounded,
             color: Colors.white,
             size: 30,
           ):
               AppText(text: '('+data.toString()+')',textSize: 15,)
          ,
          Spacer(),
          IconButton(onPressed: () {
            icon == Icons.search ?
            Navigator.push(context, MaterialPageRoute(builder:(context)=>SearchScreen()))
                :null;
          }, icon: Icon(icon)),
          AppSizedBox(
            width: 20.w,
          ),
        ],
      ),
    ),
  );
}


List<Movie> getMovie = [
  Movie(
      'MoonLight',
      'assets/img1.jpeg',
      'assets/back1.jpeg',
      'The Golden Gate Bridge '
          'is a suspension bridge spanning the Golden Gate,'
          ' the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
      7.5,
      'assets/imgbacd12.jpeg',
      'assets/imgbacd1.jpeg',
    'Barry Jenkins','Directory,Screenphy','Tarell McCraney','Story',
      'Dream','1h 51min','10/21/2016','2016',
    'assets/video1.jpeg',
    [
     'assets/artst1.jpeg',
      'assets/artst11.jpeg',
      'assets/artst12.jpeg',
      'assets/artst13.jpeg',
      'assets/artst14.jpeg',
      'assets/artst1.jpeg',
      'assets/artst11.jpeg'
    ]
  ),
  Movie(
      'Joker',
      'assets/img4.jpeg',
      'assets/back4.jpeg',
      'The Golden Gate Bridge '
          'is a suspension bridge spanning the Golden Gate,'
          ' the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
      7.2,
      'assets/img4.jpeg',
      'assets/img5.jpeg',
    'Chase Palmer','Writer','Andy Muschietti','Director',
    'Horror','2h 15min','09/06/2017','2017',
      'assets/video5.jpeg',
      [
        'assets/artst21.jpeg',
        'assets/artst22.jpeg',
        'assets/artst23.jpeg',
        'assets/artst21.jpeg',
        'assets/artst22.jpeg',
        'assets/artst23.jpeg',
      ]
  ),
  Movie(
      'Logan',
      'assets/img3.jpeg',
      'assets/video2.jpeg',
      'DecorView setVisiblity'
          'DecorView setVisiblityDecorView setVisiblity'
          'DecorView setVisiblityDecorView setVisiblity',
      7.3,
      'assets/img3.jpeg',
     'assets/video3.jpeg',
      'Barry Jenkins','Directory,Screenphy','Tarell McCraney','Story','Dream','1h 51min','10/21/2016','2016',
      'assets/video6.jpeg',
[
'assets/artst31.jpeg',
'assets/artst32.jpeg',
'assets/artst33.jpeg',
'assets/artst34.jpeg',
'assets/artst31.jpeg',
])
  ,

];

