import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/bloc/search/index.dart';

import 'index.dart';




class AppSearchBar extends StatelessWidget {
  AppSearchBar();

  late SearchBloc searchBloc;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    searchBloc = BlocProvider.of(context);
    return Column(
      children: [
        AppSizedBox(height: 70.h),
        Container(
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF191919).withOpacity(.5),
          ),
          child: AppTextField(
              controller: controller,
              hint: 'search...',
              prefix: AppIconButton(icon: Icons.search, press: () {}),
              suffix: AppIconButton(icon: Icons.close, color: Colors.white, press: () => controller.clear()),
              onChange: (value) => searchBloc.add(SearchEventFetch(movieName: value))),
        ),
      ],
    );
  }
}