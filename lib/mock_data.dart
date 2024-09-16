import 'package:weather/model/forecastday_model.dart';

class MockData {
  static List<ForecastDayModel> forecastDayData = [
    ForecastDayModel(day: "17 July", image: "assets/weather/cloudy.png", maxTemp: 20, minTemp: 17, describe: "Light Rain"),
    ForecastDayModel(day: "18 July", image: "assets/weather/snow.png", maxTemp: 15, minTemp: 9, describe: "Big Snow"),
    ForecastDayModel(day: "19 July", image: "assets/weather/cloudy (1).png", maxTemp: 25, minTemp: 20, describe: "Heavy Rain"),
    ForecastDayModel(day: "20 July", image: "assets/weather/cloudy (2).png", maxTemp: 24, minTemp: 21, describe: "Light Cloudy"),
    ForecastDayModel(day: "21 July", image: "assets/weather/storm.png", maxTemp: 10, minTemp: 0, describe: "Storm"),
  ];
}