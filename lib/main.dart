
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'home_screen.dart';
//import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
);


 /*void main(){
   runApp(MyApp());
 }

  */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (buildContext, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
            textTheme: const TextTheme(
                displayMedium: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500
                )
            )
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      );
    });
  }
}
