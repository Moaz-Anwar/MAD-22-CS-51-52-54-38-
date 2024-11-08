import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return
       GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Raleway',
          ),
          getPages: AppRoutes.pages,
          // home: PricingPlansView(),
        );
  }
}

