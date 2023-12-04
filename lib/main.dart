import 'package:aadhaar_app/screen/home/provider/home_provider.dart';
import 'package:aadhaar_app/util/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
   MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => HomeProvider(),),
     ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(useMaterial3: true),
       routes: app_routes,
     ),
   ),
  );
}