import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/screen/counter_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => CounterPage(),)
      ],
    );
  }
}
