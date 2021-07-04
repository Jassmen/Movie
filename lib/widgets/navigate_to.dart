import 'package:flutter/material.dart';

void navigateTo(context,goto) =>Navigator.push(context,
    MaterialPageRoute(builder: (context) => goto));