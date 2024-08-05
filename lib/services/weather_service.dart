import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';



class WeatherService{
  final String _api_key = 'a84cab219dcbf10696db62f61f605c05';
  final String _api = 'https://api.openweathermap.org/data/2.5/weather?';

  Future fetchLocationWeather(double lon, double lat)async {
    final uri = Uri.parse('${_api}lat=$lat&lon=$lon&appid=$_api_key&units=metric');
    Response response = await http.get(uri);
    if(response.statusCode == 200){
      return response.body;
    } else {
      return '${response.statusCode} error';
    }
 }

 Future fetchCityWeather(String city) async{
    final uri = Uri.parse('${_api}q=$city&appid=$_api_key&units=metric');
    Response response = await http.get(uri);
    if(response.statusCode == 200){
      return response.body;
    } else {
      return '${response.statusCode} error';
    }
 }
}