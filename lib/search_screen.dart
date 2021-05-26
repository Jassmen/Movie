import 'package:flutter/material.dart';
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
      backgroundColor:iconColor.withOpacity(.3),
      body: Padding(
        padding: const EdgeInsets.only(right:10,left:10),
        child: Column(
          children: [
            AppSizedBox(height: 70.h,),
            searchToolBar(size),
          //  AppSizedBox(height: 20,),
            Expanded(
              child:ListView.builder(
                itemCount: getSearchedM.length,
                itemBuilder: (context,index){
                return  Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: size.height * .2 ,
                          width: 110.w,
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: appImage(getSearchedM[index].image, size),
                        ),
                        AppSizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: (size.width/2).w,
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
                                text:
                                getSearchedM[index].movieType + '|' +
                                    getSearchedM[index].duration + '|' +
                                    getSearchedM[index].date,
                                color: Colors.white.withOpacity(.7),
                                textSize: 10),
                            AppSizedBox(
                              height: 20.h,
                            ),
                            AppText(
                                text:getSearchedM[index].description,
                                color: Colors.white.withOpacity(.7),
                                textSize: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                }))

          ],
        ),
      ),
    );
  }

  Widget searchToolBar(Size size) {
    return Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(20),
              color:Color(0xFF191919).withOpacity(.5),
            ),
            child: Row(
              children: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.search,color: iconColor,)),
                AppText(text:'Thor',color: iconColor,),
                Spacer(),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.mic,color:iconColor)),
              ],
            ),
          );
  }



final List<SearchedMovie> getSearchedM =
    [
      SearchedMovie(
          image:'assets/thor1.jpeg' ,
          movieName: 'Thor',
          rating: '7,6',
          movieType: 'Dream',
          duration: '1h 50min',
          date: '10/21/2016',
          description: 'The Golden Gate Bridge \n'
              'is a suspension bridge spanning the\n Golden Gate,'
              ' the one-mile-wide \nstrait connecting San Francisco\n Bay and the Pacific Ocean.'),
      SearchedMovie(
          image:'assets/thor2.jpeg' ,
          movieName: 'Thor:The Dark World',
          rating: '7,2',
          movieType: 'Dream',
          duration: '1h 50min',
          date: '10/21/2016',
          description: 'The Golden Gate Bridge \n'
              'is a suspension bridge spanning the\n Golden Gate,'
              ' the one-mile-wide \nstrait connecting San Francisco\n Bay and the Pacific Ocean.'),
      SearchedMovie(
          image:'assets/thor3.jpeg' ,
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