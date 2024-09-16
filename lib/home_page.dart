import 'package:flutter/material.dart';
import 'package:weather/core/app_color.dart';

import 'forecast_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(5),
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
                      child: Image.asset("assets/season/winter.jpg",
                          fit: BoxFit.cover)),
                  const Positioned(
                      right: 10,
                      top: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("-10°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 60,
                              )),
                          Text("Real feel 18°",
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
                        "25 July, Monday",
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
          const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Property(),
                  Property(),
                  Property(),
                ],
              )),
          const Expanded(flex: 1, child: Forecast())
        ],
      ),
    );
  }
}

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: LightThemeColor.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child:  InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForecastPage()));
                  },
                  child: const Text(
                  "Forecast ->",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [for (int i = 1; i <= 5; i++) const Hour()],
            )
          ],
        ));
  }
}

class Hour extends StatelessWidget {
  const Hour({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("NOW", style: TextStyle(color: Colors.white, fontSize: 15)),
        Image.asset(
          "assets/weather/cloudy.png",
          height: 30,
          width: 30,
        ),
        const Text(
          "-10°C",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }
}

class Property extends StatelessWidget {
  const Property({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width/3 - 5,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [LightThemeColor.blue, LightThemeColor.purple])),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/item/wind.png",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  const Text(
                    "Wind",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    "5-8 km/h",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

