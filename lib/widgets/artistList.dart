import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/artist/artist_bloc.dart';
import 'package:movie_app/bloc/artist/artist_state.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/widgets/build_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class ArtistList extends StatelessWidget {
  ArtistList({required this.id}) : super();
  String? id;

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return BlocBuilder<ArtistBloc, ArtistState>(builder: (context, state) {
      if (state is ArtistStateSuccess) return _artistList(state.list);
      if (state is ArtistStateFailed)
        return Center(child:AppText(
          text: 'Error',
        ),);
      return buildProgressWidget();
    });
  }

  Widget _artistList(List<CastData> castList) {
    return Container(
      height: 60.h,
      width: 1.sw,
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: castList.length > 10 ? 10 : castList.length,
          itemBuilder: (context, int index) {
            return Container(
                width: 60.w,
                height: 60.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.w),
                    border: Border.all(color: Colors.white)),
                child: appImage(castList[index].profilePath!));
          }),
    );
  }
}
