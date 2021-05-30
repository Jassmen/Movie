/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/app_sized_box.dart';
import 'package:movie_app/build_text.dart';
import 'package:movie_app/movie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

const Color iconColor = Color(0xFFD9D9D9);

class SearchScreen extends StatelessWidget {
  SearchScreen();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: iconColor.withOpacity(.3),
      body: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: Column(
          children: [
            AppSizedBox(
              height: 70.h,
            ),
            searchToolBar(size),
            searchedMovies(size)
          ],
        ),
      ),
    );
  }

  Expanded searchedMovies(Size size) {
    return Expanded(
        child: ListView.builder(
            itemCount: getSearchedM.length,
            itemBuilder: (context, index) {
              return listItem(size, index);
            }));
  }

  Container listItem(Size size, int index) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.only(left: 8.w, right: 8.w, bottom: 10.w),
        child: Row(
          children: [
            Container(
              height: .2.sh,
              width: 110.w,
              margin: EdgeInsets.only(
                left: 10.w,
              ),
              child: appImage(getSearchedM[index].image, size),
            ),
            AppSizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (1 / 2).sw,
                    child: Row(
                      children: [
                        AppText(
                          text: getSearchedM[index].movieName,
                          fontWeight: FontWeight.bold,
                          textSize: 12,
                        ),
                        Spacer(),
                        AppText(
                          text: getSearchedM[index].rating,
                          fontWeight: FontWeight.bold,
                          textSize: 12,
                        ),
                      ],
                    ),
                  ),
                  AppSizedBox(
                    height: 10.h,
                  ),
                  AppText(
                      text: getSearchedM[index].movieType +
                          '|' +
                          getSearchedM[index].duration +
                          '|' +
                          getSearchedM[index].date,
                      color: Colors.white.withOpacity(.7),
                      textSize: 10),
                  AppSizedBox(
                    height: 20.h,
                  ),
                  AppText(
                      text: getSearchedM[index].description,
                      color: Colors.white.withOpacity(.7),
                      textSize: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchToolBar(Size size) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF191919).withOpacity(.5),
      ),
      child: TextField(
        onTap: () {},
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Thor',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: iconColor,
                )),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: iconColor,
                ))),
      ),
    );
  }


  final List<SearchedMovie> getSearchedM = [
    SearchedMovie(
        image: 'assets/thor1.jpeg',
        movieName: 'Thor',
        rating: '7,6',
        movieType: 'Dream',
        duration: '1h 50min',
        date: '10/21/2016',
        description: 'The Golden Gate Bridge \n'
            'is a suspension bridge spanning the\n Golden Gate,'
            ' the one-mile-wide \nstrait connecting San Francisco\n Bay and the Pacific Ocean.'),
    SearchedMovie(
        image: 'assets/thor2.jpeg',
        movieName: 'Thor:The Dark World',
        rating: '7,2',
        movieType: 'Dream',
        duration: '1h 50min',
        date: '10/21/2016',
        description: 'The Golden Gate Bridge \n'
            'is a suspension bridge spanning the\n Golden Gate,'
            ' the one-mile-wide \nstrait connecting San Francisco\n Bay and the Pacific Ocean.'),
    SearchedMovie(
        image: 'assets/thor3.jpeg',
        movieName: 'Thor:Ragnarok',
        rating: 'NR',
        movieType: 'Dream',
        duration: '1h 50min',
        date: '10/21/2016',
        description: 'The Golden Gate Bridge \n'
            'is a suspension bridge spanning the\n Golden Gate,'
            ' the one-mile-wide \nstrait connecting San Francisco\n Bay and the Pacific Ocean.'),
  ];
}
*/
