

import 'package:flutter/material.dart';
import 'package:responsive_app/screens/chat_scree.dart';
import 'package:responsive_app/screens/product_details.dart';
import 'package:responsive_app/screens/weeks_overview_screen.dart';

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScree() 
    );
  }
}