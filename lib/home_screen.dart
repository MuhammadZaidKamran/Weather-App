import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/container/new_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool loading = true;

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  void getdata() async {
    final String url = 'https://yahoo-weather5.p.rapidapi.com/weather';
    final Map<String,String> headers = {
      'X-RapidAPI-Key': 'f45d8848eamshad6366977ca5fe3p1c8858jsnb2a47996e921',
      'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com'
    };
    final Map<String,String> params = {'location': 'karachi', 'u': 'c'};

    Uri uri = Uri.parse(url);
    uri = uri.replace(queryParameters: params);

    try {
      final response = await http.get(uri,headers: headers);
      Map<String,dynamic> res = await json.decode(response.body);
      print(res);
      if(res.isNotEmpty) loading = false;
    } catch (e) {
      print(e);
      loading = true;
    }
  }

  // getpostApi() async {
  //   var url = Uri.parse('https://yahoo-weather5.p.rapidapi.com/weather');
  //   var response = await http.get(url);
  //   var responseBody = jsonDecode(response.body);
  //   return responseBody;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 241, 241, 241),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Karachi/Pakistan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text("Asia",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)
                ],),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("location",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: Colors.white),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/cloud_sun_pic.webp",height: 210,width: 210,),
                    Text("24`",style: TextStyle(fontSize: 62,fontWeight: FontWeight.w600,color: Colors.white),)
                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherContainer(),
                    WeatherContainer(),
                    WeatherContainer(),
                    //WeatherContainer(),
                  ],
                )
              ],
            ),
            height: 550,
            decoration: BoxDecoration(
              color: homeColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context,index){
            return Container(
             // foregroundDecoration: BoxDecoration(color: Color.fromARGB(117, 182, 182, 182),),
              //color: Color.fromARGB(117, 182, 182, 182),
              padding: EdgeInsets.all(10),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: homeColor,width: 0.5)),
                tileColor: Color.fromARGB(106, 214, 247, 255),
                leading: Text("Mon"),
                title: Row(
                  children: [
                    Image.asset("assets/images/cloud_sun_pic.webp",height: 40,width: 40,),
                    Text("Sunny",style: TextStyle(fontSize: 14),),
                  ],
                ),
                trailing: Text("23`",style: TextStyle(fontSize: 13),),
              ),
            );
          }))
        ],
      ),
    );
  }
}