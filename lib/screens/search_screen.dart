import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/search/search_bloc.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/model/search.dart';
import 'package:movie_app/screens/search_screen1.dart';
import 'package:movie_app/widgets/app_image.dart';
import 'package:movie_app/widgets/app_sized_box.dart';
import 'package:movie_app/widgets/build_text.dart';

import 'home_screen.dart';



const Color iconColor = Color(0xFFD9D9D9);
 Color backgroundColor = iconColor.withOpacity(.3);

class SearchScreen extends StatelessWidget {
  final String nameOfMovie;
  SearchScreen({required this.nameOfMovie});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('nameOfMovie------------------------$nameOfMovie');
    return BlocProvider(
      create: (_) =>  SearchBloc()..add(SearchEventFetch(movieName:'${nameOfMovie.toString()}')),
      child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchStateSuccess) return _buildBody(state.list,context, searchController);
            if (state is SearchStateFailed) {
             return SearchScreen1(notFound: true,);
          //return AppText(text: state.error);
        }

        return buildProgressWidget();
          }
      ),
    );
  }
    Scaffold _buildBody(List<Search> list,BuildContext context,TextEditingController searchController) {
      return Scaffold(
        backgroundColor:backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: Column(
            children: [
              AppSizedBox(height: 70.h),
             buildAppBar(context,searchController),
              searchedMovies(list)
            ],
          ),
        ),
      );
    }

    Expanded searchedMovies(List<Search> list) {
      return Expanded(
          child: ListView.builder(
              itemCount: list.length >5 ? 5 :list.length,
              itemBuilder: (context, index) {
                return listItem(list[index]);
              }));
    }

    Container listItem(Search index) {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 10.w),
          child: Row(
            children: [
              Container(
                height: .2.sh,
                width: 110.w,
                margin: EdgeInsets.only(
                  left: 10.w,
                ),
                child: appImage(index.backdropPath), ///////
              ),
              AppSizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: .5.sw,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: AppText(
                              text: index.title, ///////////////
                              fontWeight: FontWeight.bold,
                              textSize: 12,
                            ),
                          ),
                          Spacer(),
                          AppText(
                            text: index.rating, ////////////
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
                        text: index.date,
                        color: Colors.white.withOpacity(.7),
                        textSize: 10),
                    AppSizedBox(
                      height: 20.h,
                    ),
                    AppText(
                        text: index.overview,
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

  }





