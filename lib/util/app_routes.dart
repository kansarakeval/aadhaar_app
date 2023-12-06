import 'package:aadhaar_app/screen/home/view/app_link_screen.dart';
import 'package:aadhaar_app/screen/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> app_routes = {
  '/':(context) => HomeScreen(),
  'link': (context) => AppLinkScreen(),
};