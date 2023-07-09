import 'package:flutter/material.dart';
import 'package:foody/fooddetail/food_detail_page.dart';
import 'package:foody/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetail(),
    );
  }
}
