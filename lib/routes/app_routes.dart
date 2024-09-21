import 'package:flutter/material.dart';
import '../screen/today/today_screen.dart';

class AppRoutes {
  static const String todayScreen = '/today_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes =>
      {todayScreen: TodayScreen.builder, initialRoute: TodayScreen.builder};
}
