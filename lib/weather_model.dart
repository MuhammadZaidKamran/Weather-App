// class Weather {
//   final String mainCondition;
//   final double temperature;

//   Weather({required this.mainCondition,required this.temperature});

//   factory Weather.fromJson(Map<String,dynamic> json) {
//     return Weather(mainCondition: json['weather'][0]['main'].toString(), temperature: json["main"]["temp"]);
//   }
// }