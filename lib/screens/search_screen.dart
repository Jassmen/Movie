import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/search/search_bloc.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/model/search.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/s1.dart';
import 'package:movie_app/widgets/app_search_bar.dart';
import 'package:movie_app/widgets/app_sized_box.dart';
import 'package:movie_app/widgets/build_text.dart';
import 'package:movie_app/widgets/search_list.dart';


class SearchScreen extends StatelessWidget {
   SearchScreen();
   SearchBloc searchBloc =SearchBloc();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child:Padding(
          padding:EdgeInsets.all(20.w),
          child: Column(
            children: [
              AppSearchBar(),
              AppSizedBox(height: 20.w),
              Container(
                child: BlocProvider(
                  create: (_) => searchBloc,
                  child: BlocBuilder<SearchBloc,SearchState>(
                    builder: (context,state){
                      if(state is SearchStateLoading)
                        {
                          return buildProgressWidget();
                        }
                      if(state is SearchStateSuccess)
                        {
                          return searchedList(state.list);
                        }
                      if(state is SearchStateFailed){
                        return Center(
                          child: AppText(text: 'Not Found',),
                        );
                      }
                      return Center(child: AppText(text: 'NO Searched Item',),);

                    },

                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }





  
}
