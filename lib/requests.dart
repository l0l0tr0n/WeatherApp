import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherRequest{
  static const String apiKey = '5fef9c9b3cf8f7a4c22814d358eeb733';

  get _dio => null;

  Future<Response> request(String url, {dynamic body, String? method}) async{
    var res = _dio.request(url,
        data: body,
        options: Options(
          method: method,
        ));

    return res;
  }

  Future<String> getWeather() async{
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    double lon = position.longitude;
    double lat = position.latitude;

    Response response = await request('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric',
      method: 'GET');

    return response.data.toString();
  }
}