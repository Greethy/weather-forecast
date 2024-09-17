import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'forecast_provider.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ForecastScreenState createState() => ForecastScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForecastProvider(),
      child: ForecastScreen(),
    );
  }
}

class ForecastScreenState extends State<ForecastScreen> {
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
                                padding: EdgeInsets.only(left: 32),
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
                              "22°C",
                              style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 70,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 72),
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
                  SizedBox(height: 8),
                  _buildForecastSection(context),
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
      margin: EdgeInsets.symmetric(horizontal: 24),
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
  Widget _buildForecastSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: Color(0XFF212325),
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "10 days forecast",
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 17,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14),
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: Consumer<ForecastProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12,
                    );
                  },
                  itemCount:
                      provider.forecastModelObj.forecastTwoItemList.length,
                  itemBuilder: (context, index) {
                    ForecastTwoItemModel model =
                        provider.forecastModelObj.forecastTwoItemList[index];
                    return ForecastTwoItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class ForecastTwoItemWidget extends StatelessWidget {
  ForecastTwoItemWidget(this.forecastTwoItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ForecastTwoItemModel forecastTwoItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          forecastTwoItemModelObj.julyCounter!,
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 20),
        Padding(
          child: Image.asset(
            "assets/images/img_cloudy_1_1.png",
            height: 34,
            width: 36,
          ),
          padding: EdgeInsets.all(0)
        ),
        SizedBox(width: 20),
        Text(
          forecastTwoItemModelObj.nineteen!,
          style: TextStyle(
            color: Color(0XFFFFFFFF),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 20),
        Container(
          height: 1,
          width: 34,
          decoration: BoxDecoration(
            color: Color(0XFF6C707A),
          ),
        ),
        SizedBox(width: 20),
        Text(
          forecastTwoItemModelObj.fifteen!,
          style: TextStyle(
            color: Color(0XFF6C707A),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 20),
        Text(
          forecastTwoItemModelObj.sunshower!,
          style: TextStyle(
            color: Color(0XFF6C707A),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
