import 'package:flutter/material.dart';
import 'forecast_screen.dart';

// ignore_for_file: must_be_immutable
class ForecastModel {
  List<ForecastTwoItemModel> forecastTwoItemList = [
    ForecastTwoItemModel(
        julyCounter: "28 July",
        nineteen: "19°",
        fifteen: "15°",
        sunshower: "Sunshower"),
    ForecastTwoItemModel(
        julyCounter: "28 July",
        nineteen: "19°",
        fifteen: "15°",
        sunshower: "Sunshower"),
    ForecastTwoItemModel(
        julyCounter: "28 July",
        nineteen: "19°",
        fifteen: "15°",
        sunshower: "Sunshower"),
    ForecastTwoItemModel(
        julyCounter: "28 July",
        nineteen: "19°",
        fifteen: "15°",
        sunshower: "Sunshower")
  ];
}

/// This class is used in the [forecast_two_item_widget] screen.

// ignore_for_file: must_be_immutable
class ForecastTwoItemModel {
  ForecastTwoItemModel(
      {this.julyCounter,
      this.nineteen,
      this.fifteen,
      this.sunshower,
      this.id}) {
    julyCounter = julyCounter ?? "28 July";
    nineteen = nineteen ?? "19°";
    fifteen = fifteen ?? "15°";
    sunshower = sunshower ?? "Sunshower";
    id = id ?? "";
  }

  String? julyCounter;

  String? nineteen;

  String? fifteen;

  String? sunshower;

  String? id;
}

/// A provider class for the ForecastScreen.
///
/// This provider manages the state of the ForecastScreen, including the
/// current forecastModelObj

// ignore_for_file: must_be_immutable
class ForecastProvider extends ChangeNotifier {
  ForecastModel forecastModelObj = ForecastModel();

  @override
  void dispose() {
    super.dispose();
  }
}
