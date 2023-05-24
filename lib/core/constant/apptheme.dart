import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily:"PlayfairDisplay",
    primarySwatch: Colors.blue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
    appBarTheme: AppBarTheme(

        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.white),
        titleTextStyle: const TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontFamily: "Cairo",
          fontSize: 25
        ),
      backgroundColor: AppColor.primaryColor
    ),
    textTheme: const TextTheme(
      headline1: TextStyle( fontWeight: FontWeight.bold,fontSize: 22,color: AppColor.black),
      headline2: TextStyle( fontWeight: FontWeight.bold,fontSize: 26,color: AppColor.black),
      bodyText1: TextStyle(height: 2,fontSize: 12,color: AppColor.grey,fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2,fontSize: 12,color: AppColor.grey,),
    )
);
ThemeData themeArabic = ThemeData(
    fontFamily:"Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle( fontWeight: FontWeight.bold,fontSize: 22,color: AppColor.black),
      headline2: TextStyle( fontWeight: FontWeight.bold,fontSize: 26,color: AppColor.black),
      bodyText1: TextStyle(height: 2,fontSize: 14,color: AppColor.grey,fontWeight: FontWeight.bold),
      bodyText2: TextStyle(height: 2,fontSize: 14,color: AppColor.grey,),
    )
);

var defaultStyle = TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold);
