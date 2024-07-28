import 'package:bmi_claculator/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:bmi_claculator/model/page_routs.dart";

import 'view/pages/result_page.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      theme:ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0C1F),
        cardColor: const Color(0xFF21233B),
        hoverColor: const Color(0xFF17182A),
        sliderTheme: const SliderThemeData(
          trackHeight:3,
          valueIndicatorColor: Color(0xFFEB1555),
          activeTrackColor: Color(0xFFEB1555),
          inactiveTrackColor:Color(0xFFDDE1E1) ,
          thumbColor: Color(0xFFEB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
        ),
        brightness: Brightness.dark,
      ),
      
      initialRoute: Routes.home,
      getPages: [
        GetPage(name: Routes.home, page: () => const HomePage()),
        GetPage(name: Routes.result, page: ()=> const ResultPage()),
      ],
    );
  }
}
