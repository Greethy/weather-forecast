import 'package:flutter/material.dart';
import 'package:weather/core/app_color.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast"),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset("assets/season/autumn.jpg",
                            fit: BoxFit.cover)),
                    const Positioned(
                        right: 10,
                        top: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("22°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 60,
                                )),
                            Text("Real feel 25°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ))
                          ],
                        )),
                    const Positioned(
                        top: 30,
                        left: 30,
                        child: Text(
                          "25 August, Monday",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                    const Positioned(
                        bottom: 20,
                        right: 20,
                        child: Row(
                          children: [
                            Text(
                              "Việt Nam",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                            Icon(
                              Icons.screen_share_rounded,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: LightThemeColor.black
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("10 days forecast", style: TextStyle(fontSize: 17, color: Colors.white)),
                      const SizedBox(height: 20),
                      for (int i = 0; i < 5; i++)
                        i != 4 ? const Column(children: [ForecastDay(day: day, image: image, maxTemp: maxTemp, minTemp: minTemp, describe: describe), SizedBox(height: 10)])
                            : ForecastDay(day: day, image: image, maxTemp: maxTemp, minTemp: minTemp, describe: describe)
                    ],
                  )
                )
            )
          ],
        ),
      ),
    );
  }
}
class ForecastDay extends StatelessWidget {
  final String day;
  final String image;
  final double maxTemp;
  final double minTemp;
  final String describe;
  const ForecastDay({super.key, required this.day, required this.image, required this.maxTemp, required this.minTemp, required this.describe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(day, style: TextStyle(fontSize: 12, color: Colors.white),),
        Image.asset(image, height: 30, width: 30,),
        Text("$maxTemp°", style: TextStyle(fontSize: 16, color: Colors.white),),
        Divider(height: 10, color: LightThemeColor.grey, thickness: 3, endIndent: 5,),
        Text("$minTemp°", style: TextStyle(fontSize: 13, color: LightThemeColor.grey)),
        Text(describe, style: TextStyle(fontSize: 16, color: LightThemeColor.grey))
      ],
    );
  }
}