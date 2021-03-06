import 'package:weather_app/data/api/model/current_location/api_current_location_data.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';

class CurrentLocationMapper {
  static CurrentLocationData fromApi(ApiCurrentLocationData data) {
    return CurrentLocationData(
      latitude: data.latitude != null ? data.latitude!.roundToDouble() : 0.0,
      longitude: data.longitude != null ? data.longitude!.roundToDouble() : 0.0,
      city: data.city ?? "",
      country: data.country ?? "",
    );
  }
}
