import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:today/forecast_screen.dart';
import 'today_provider.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key})
      : super(
          key: key,
        );

  @override
  TodayScreenState createState() => TodayScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodayProvider(),
      child: TodayScreen(),
    );
  }
}

class TodayScreenState extends State<TodayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF1A1C1E),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 6,
                top: 6,
                right: 6,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 448,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          child: Image.asset(
                            "assets/images/img_rectangle_1.png",
                            height: 448,
                            width: double.maxFinite,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 36),
                                child: Text(
                                  "25 July, Monday",
                                  style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 46),
                            Text(
                              "-10°C",
                              style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 70,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 98),
                              child: Text(
                                "Real feel 18°C",
                                style: TextStyle(
                                  color: Color(0XFFFFFFFF),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(height: 210),
                            _buildLocationInfo(context)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildWeatherProperties(context),
                  SizedBox(height: 10),
                  _buildHourlyForecast(context),
                  SizedBox(height: 4)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationInfo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Viet Nam",
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 10,
              width: 8,
              child: SvgPicture.asset(
                "assets/images/img_vector.svg",
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherProperties(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Opacity(
        opacity: 0.8,
        child: SizedBox(
          height: 118,
          width: 346,
          child: Consumer<TodayProvider>(
            builder: (context, provider, child) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8,
                  );
                },
                itemCount:
                    provider.todayModelObj.weatherpropertiesItemList.length,
                itemBuilder: (context, index) {
                  WeatherpropertiesItemModel model =
                      provider.todayModelObj.weatherpropertiesItemList[index];
                  return WeatherpropertiesItemWidget(
                    model,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHourlyForecast(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0XFF212325),
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForecastScreen()));
                  },
                  child: Text(
                    "Forecast ->",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                SizedBox(
                  height: 72,
                  width: 286,
                  child: Consumer<TodayProvider>(
                    builder: (context, provider, child) {
                      return ListView.separated(
                        padding: EdgeInsets.only(right: 4),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 28,
                          );
                        },
                        itemCount:
                            provider.todayModelObj.hoursOneItemList.length,
                        itemBuilder: (context, index) {
                          HoursOneItemModel model =
                              provider.todayModelObj.hoursOneItemList[index];
                          return HoursOneItemWidget(
                            model,
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2)
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class HoursOneItemWidget extends StatelessWidget {
  HoursOneItemWidget(this.hoursOneItemModelObj, {Key? key})
      : super(
          key: key,
        );

  HoursOneItemModel hoursOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            hoursOneItemModelObj.nowOne!,
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Image.asset(
              hoursOneItemModelObj.nowTwo!,
              height: 30,
              width: double.maxFinite,
            ),
          ),
          Text(
            hoursOneItemModelObj.ten!,
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class WeatherpropertiesItemWidget extends StatelessWidget {
  WeatherpropertiesItemWidget(this.weatherpropertiesItemModelObj, {Key? key})
      : super(
          key: key,
        );

  WeatherpropertiesItemModel weatherpropertiesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [Color(0XFF5896FD), Color(0XFFAB89FE)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: SizedBox(
              height: 18,
              width: 12,
              child: SvgPicture.asset(
                weatherpropertiesItemModelObj.windOne!,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            weatherpropertiesItemModelObj.windTwo!,
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6),
          Text(
            weatherpropertiesItemModelObj.kmh!,
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
