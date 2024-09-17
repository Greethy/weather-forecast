import 'package:flutter/material.dart';
import 'today_screen.dart';

/// This class is used in the [hours_one_item_widget] screen.

// ignore_for_file: must_be_immutable
class HoursOneItemModel {
  HoursOneItemModel({this.nowOne, this.nowTwo, this.ten, this.id}) {
    nowOne = nowOne ?? "NOW";
    nowTwo = nowTwo ?? "assets/images/img_storm_1.png";
    ten = ten ?? "-10°";
    id = id ?? "";
  }

  String? nowOne;

  String? nowTwo;

  String? ten;

  String? id;
}

// ignore_for_file: must_be_immutable
class TodayModel {
  List<WeatherpropertiesItemModel> weatherpropertiesItemList = [
    WeatherpropertiesItemModel(
        windOne: "assets/images/img_vector_18x12.svg",
        windTwo: "Wind",
        kmh: "5-8 km/h"),
    WeatherpropertiesItemModel(
        windOne: "assets/images/img_vector_1.svg",
        windTwo: "Pressure",
        kmh: "1000 MB"),
    WeatherpropertiesItemModel(
        windOne: "assets/images/img_vector_2.svg",
        windTwo: "Humidity",
        kmh: "51%")
  ];

  List<HoursOneItemModel> hoursOneItemList = [
    HoursOneItemModel(
        nowOne: "NOW", nowTwo: "assets/images/img_storm_1.png", ten: "-10°"),
    HoursOneItemModel(
        nowOne: "3 AM", nowTwo: "assets/images/img_snow_1.png", ten: "-23°"),
    HoursOneItemModel(
        nowOne: "4 AM", nowTwo: "assets/images/img_snow_1.png", ten: "-22°"),
    HoursOneItemModel(
        nowOne: "5 AM",
        nowTwo: "assets/images/img_cloudy_2_1.png",
        ten: "-14°"),
    HoursOneItemModel(
        nowOne: "6 AM", nowTwo: "assets/images/img_cloudy_1_1.png", ten: "-3°")
  ];
}

/// This class is used in the [weatherproperties_item_widget] screen.

// ignore_for_file: must_be_immutable
class WeatherpropertiesItemModel {
  WeatherpropertiesItemModel({this.windOne, this.windTwo, this.kmh, this.id}) {
    windOne = windOne ?? "assets/images/img_vector_18x12.svg";
    windTwo = windTwo ?? "Wind";
    kmh = kmh ?? "5-8 km/h";
    id = id ?? "";
  }

  String? windOne;

  String? windTwo;

  String? kmh;

  String? id;
}

/// A provider class for the TodayScreen.
///
/// This provider manages the state of the TodayScreen, including the
/// current todayModelObj

// ignore_for_file: must_be_immutable
class TodayProvider extends ChangeNotifier {
  TodayModel todayModelObj = TodayModel();

  @override
  void dispose() {
    super.dispose();
  }
}
