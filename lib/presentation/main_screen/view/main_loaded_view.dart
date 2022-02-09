import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/api/model/current_weather/api_current_weather_data.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/internal/current_weather_di/current_weather_controller.dart';
import 'package:weather_app/internal/locator.dart';
import 'package:weather_app/presentation/main_screen/components/days_weather_data_header.dart';
import 'package:weather_app/presentation/main_screen/components/days_weather_data_item.dart';
import 'package:weather_app/presentation/main_screen/components/location_app_header.dart';
import 'package:weather_app/presentation/main_screen/components/main_app_bar.dart';
import 'package:weather_app/presentation/main_screen/components/main_data_card.dart';
import 'package:weather_app/presentation/next_screen/details_weather_data_screen.dart';

Scaffold createMainLoadedView({
  required BuildContext context,
  required CurrentWeatherData data,
}) {
  //Temperary data
  List<AdditionalData> additionalData = [
    AdditionalData(
        url: "assets/icons/wind.png",
        title: S.of(context).wind,
        data: S.of(context).wind_example),
    AdditionalData(
        url: "assets/icons/thermometer.png",
        title: S.of(context).feel_like,
        data: S.of(context).feel_like_example),
    AdditionalData(
        url: "assets/icons/sun.png",
        title: S.of(context).index_uv,
        data: S.of(context).index_uv_example),
    AdditionalData(
        url: "assets/icons/pulse.png",
        title: S.of(context).pressure,
        data: S.of(context).pressure_example),
  ];

  List<DayData> dayTempuratureData = [
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_blue.png",
        selectedUrl: "assets/icons/white/cloudy_white.png",
        temperature: "21",
        time: "2:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
        selectedUrl: "assets/icons/white/cloudy_sun_white.png",
        temperature: "20",
        time: "4:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
        selectedUrl: "assets/icons/white/rain_cloudy_white.png",
        temperature: "22",
        time: "6:00"),
    DayData(
        unselectedUrl: "assets/icons/sun_card_icon.png",
        selectedUrl: "assets/icons/sun_card_icon.png",
        temperature: "23",
        time: "8:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_blue.png",
        selectedUrl: "assets/icons/white/cloudy_white.png",
        temperature: "22",
        time: "10:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
        selectedUrl: "assets/icons/white/cloudy_sun_white.png",
        temperature: "24",
        time: "12:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
        selectedUrl: "assets/icons/white/rain_cloudy_white.png",
        temperature: "25",
        time: "14:00"),
    DayData(
        unselectedUrl: "assets/icons/sun_card_icon.png",
        selectedUrl: "assets/icons/sun_card_icon.png",
        temperature: "22",
        time: "16:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_blue.png",
        selectedUrl: "assets/icons/white/cloudy_white.png",
        temperature: "22",
        time: "18:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/cloudy_sun_blue.png",
        selectedUrl: "assets/icons/white/cloudy_sun_white.png",
        temperature: "21",
        time: "20:00"),
    DayData(
        unselectedUrl: "assets/icons/blue/rain_cloudy_blue.png",
        selectedUrl: "assets/icons/white/rain_cloudy_white.png",
        temperature: "20",
        time: "22:00"),
    DayData(
        unselectedUrl: "assets/icons/sun_card_icon.png",
        selectedUrl: "assets/icons/sun_card_icon.png",
        temperature: "18",
        time: "24:00"),
  ];

  return Scaffold(
    backgroundColor: Theme.of(context).backgroundColor,
    appBar: createMainAppBar(
      context: context,
      onThemeModeClick: () {},
      onFavouriteClick: () {},
      onSearchClick: () {},
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            createLocationAppHeader(
                context: context,
                nameCity: S.of(context).example_name_city,
                nameCountry: S.of(context).example_name_country),
            const SizedBox(
              height: 30,
            ),
            createMainDataCard(
              context: context,
              url: "assets/icons/white/cloudy_white.png",
              typeWeather: StringUtils.capitalize(data.weather.description!),
              date: S.of(context).date_example,
              temperature: data.main.temp!.toInt().round().toString(),
              windData: data.wind.speed!.round().toString(),
              feelLikeData: data.main.feelsLike!.round().toString(),
              indexUvData: S.of(context).index_uv_example,
              pressureData: data.main.pressure.toString(),
            ),
            const SizedBox(
              height: 30,
            ),
            createDaysWeatherDataHeader(
                context: context,
                onNextClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: dayTempuratureData.length,
                  itemBuilder: (context, index) => createDaysWeatherDataItem(
                    context: context,
                    time: dayTempuratureData[index].time,
                    temperature: dayTempuratureData[index].temperature,
                    url: dayTempuratureData[index].unselectedUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

//temporary classes

class AdditionalData {
  final String url;
  final String title;
  final String data;

  AdditionalData({required this.url, required this.title, required this.data});
}

class DayData {
  final String selectedUrl;
  final String unselectedUrl;
  final String temperature;
  final String time;

  DayData({
    required this.selectedUrl,
    required this.unselectedUrl,
    required this.temperature,
    required this.time,
  });
}
