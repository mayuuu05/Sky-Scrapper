class WeatherModal {
  late Location location;
  late Current current;

  WeatherModal({required this.location,required this.current});

  factory WeatherModal.fromJson(Map m1)
  {
    return WeatherModal(location: Location.fromJson(m1['location']), current: Current.fromJson(m1['current']));
  }
}

class Location {
  late String name, region, country, tz_id, localtime;
  late int localtime_epoch;
  late double lon, lat;

  Location(
      {required this.name, required this.region, required this.country, required this.tz_id, required this.localtime, required
      this.localtime_epoch, required this.lon, required this.lat});

  factory Location.fromJson(Map m1)
  {
    return Location(name: m1['name'],
        region: m1['region'],
        country: m1['country'],
        tz_id: m1['tz_id'],
        localtime: m1['localtime'],
        localtime_epoch: m1['localtime_epoch'],
        lon: m1['lon'].toDouble(),
        lat: m1['lat'].toDouble(),);
  }
}

class Current {
  late int is_day,
      last_updated_epoch,
      wind_degree,
      humidity,
      cloud;

  late String last_updated, wind_dir;
  late double
  temp_c,
      temp_f,
      wind_mph,
      wind_kph,
      pressure_in,
      pressure_mb,
      precip_mm,
      precip_in,
      feelslike_c,
      feelslike_f,
      windchill_c,
      windchill_f,
      vis_km,
      vis_miles,
      heatindex_c,
      heatindex_f,
      dewpoint_c,
      dewpoint_f,
      uv,
      gust_kph,
      gust_mph;
  late Condition condition;

  Current({required this.is_day,
    required this.last_updated_epoch,
    required this.wind_mph,
    required this.wind_degree,
    required this.pressure_mb,
    required this.humidity,
    required this.cloud,
    required this.vis_km,
    required this.vis_miles,
    required this.uv,
    required this.gust_mph,
    required this.last_updated,
    required this.wind_dir,
    required this.temp_c,
    required this.temp_f,
    required this.wind_kph,
    required this.pressure_in,
    required this.precip_mm,
    required this.precip_in,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.windchill_c,
    required this.windchill_f,
    required this.heatindex_c,
    required this.heatindex_f,
    required this.dewpoint_c,
    required this.dewpoint_f,
    required this.gust_kph,
    required this.condition});

  factory Current.fromJson(Map m1) {
    return Current(
        is_day: m1['is_day'],
        last_updated_epoch: m1['last_updated_epoch'],
        wind_mph: m1['wind_mph'].toDouble(),
        wind_degree: m1['wind_degree'],
        pressure_mb: m1['pressure_mb'].toDouble(),
        humidity: m1['humidity'],
        cloud: m1['cloud'],
        vis_km: m1['vis_km'].toDouble(),
        vis_miles: m1['vis_miles'].toDouble(),
        uv: m1['uv'].toDouble(),
        gust_mph: m1['gust_mph'].toDouble(),
        last_updated: m1['last_updated'],
        wind_dir: m1['wind_dir'],
        temp_c: m1['temp_c'].toDouble(),
        temp_f: m1['temp_f'].toDouble(),
        wind_kph: m1['wind_kph'].toDouble(),
        pressure_in: m1['pressure_in'].toDouble(),
        precip_mm: m1['precip_mm'].toDouble(),
        precip_in: m1['precip_in'].toDouble(),
        feelslike_c: m1['feelslike_c'].toDouble(),
        feelslike_f: m1['feelslike_f'].toDouble(),
        windchill_c: m1['windchill_c'].toDouble(),
        windchill_f: m1['windchill_f'].toDouble(),
        heatindex_c: m1['heatindex_c'].toDouble(),
        heatindex_f: m1['heatindex_f'].toDouble(),
        dewpoint_c: m1['dewpoint_c'].toDouble(),
        dewpoint_f: m1['dewpoint_f'].toDouble(),
        gust_kph: m1['gust_kph'].toDouble(),
        condition: Condition.fromJson(m1['condition']));
  }


}

class Condition {
  late String text, icon;
  late int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map m1) {
    return Condition(text: m1['text'], icon: m1['icon'], code: m1['code']);
  }
}
