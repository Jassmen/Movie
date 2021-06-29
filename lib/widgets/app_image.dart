import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appImage(String img) {
  return Container(
    height: 1.sh,
    width: 1.sw,
    child: CachedNetworkImage(
      key: UniqueKey(),
      fit: BoxFit.cover,
      imageUrl: 'https://image.tmdb.org/t/p/original${img}',
      placeholder: (context, url) => Container(color: Colors.black12),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}