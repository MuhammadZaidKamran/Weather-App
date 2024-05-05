import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/container/new_containers.dart';
import 'package:weather_app/islamabad_weather.dart';
import 'package:weather_app/lahore_weather.dart';
import 'package:weather_app/multan_weather.dart';
import 'package:weather_app/peshawar_weather.dart';
import 'package:weather_app/quetta_weather.dart';
import 'package:weather_app/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  //Weather? weather;

  String firstValue = "Karachi";
  var dropDownItems = [
    "Karachi",
    "Lahore",
    "Islamabad",
    "Multan",
    "Peshawar",
    "Quetta",
  ];

//  @override
//   void initState() {
//     getApi();
//     // TODO: implement initState
//     super.initState();
//   }

  getApi() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=karachi,{country%20code}&appid=5d231ad57ebdf04883253c1dafa479e2");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  // bool loading = true;

  

  // void getdata() async {
  //   final String url = 'https://yahoo-weather5.p.rapidapi.com/weather';
  //   final Map<String,String> headers = {
  //     'X-RapidAPI-Key': 'f45d8848eamshad6366977ca5fe3p1c8858jsnb2a47996e921',
  //     'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com'
  //   };
  //   final Map<String,String> params = {'location': 'karachi', 'u': 'c'};

  //   Uri uri = Uri.parse(url);
  //   uri = uri.replace(queryParameters: params);

  //   try {
  //     final response = await http.get(uri,headers: headers);
  //     Map<String,dynamic> res = await json.decode(response.body);
  //     print(res);
  //     if(res.isNotEmpty) loading = false;
  //   } catch (e) {
  //     print(e);
  //     loading = true;
  //   }
  // }

  // getpostApi() async {
  //   var url = Uri.parse('https://yahoo-weather5.p.rapidapi.com/weather');
  //   var response = await http.get(url);
  //   var responseBody = jsonDecode(response.body);
  //   return responseBody;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeColor,
        body: FutureBuilder(
          future: getApi(),
          builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
             return  Column(
                       children: [
                         Container(          
             // color: homeColor,
              padding: const EdgeInsets.symmetric(horizontal: 40),
             // height: 550,
              //decoration: BoxDecoration(
               // color: homeColor,
                //borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
              //),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                          items: dropDownItems.map((item) {
                          return DropdownMenuItem(
                            child: Text(item,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),value: item,);
                        }).toList(), onChanged: (newValue){
                          setState(() {
                           // firstValue = newValue.toString();
                            if (newValue == "Lahore") {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LahoreScreen()));
                              setState(() {});
                            } else if(newValue == "Islamabad") {
                              setState(() {});
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const IslamabadScreen()));
                            } else if(newValue == "Multan") {
                              setState(() {});
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MultanScreen()));
                            } else if(newValue == "Peshawar") {
                              setState(() {});
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PeshawarScreen()));
                            } else if(newValue == "Quetta") {
                              setState(() {});
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const QuettaScreen()));
                            }
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => const LahoreScreen()));
                          });  
                        },
                        value: firstValue,
                        //style: TextStyle(color: Color.fromARGB(255, 61, 54, 54),fontSize: 18,fontWeight: FontWeight.w600),
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),
                        iconSize: 25,
                        dropdownColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Pakistan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                        Spacer(),
                        Text("${DateTime.now().hour} : ${DateTime.now().minute}  ${DateTime.now().timeZoneName}",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text("Asia",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                    Spacer(),
                    Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800),)
                  ],),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data['weather'][0]['main'].toString(),style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: Colors.white),)
                    ],
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/cloud_sun_pic.webp",height: 250,width: 250,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: const Color.fromARGB(117, 182, 182, 182),
                              border: Border.all(color: Colors.white,width: 0.5),
                              borderRadius: BorderRadius.circular(30)
                              ),
                             child: Column(
                                 children: [
                                 const Text("Min",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                                  Image.asset("assets/images/cloud_sun_pic.webp",height: 40,width: 40,),
                                  Text("${(snapshot.data["main"]["temp_min"] - 273).toStringAsFixed(0)}°",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                             ],
                           ),
                          ),
                          Spacer(),
                          Text("${(snapshot.data["main"]["temp"] - 273).toStringAsFixed(0)}°",style: TextStyle(fontSize: 64,fontWeight: FontWeight.w600,color: Colors.white),),
                          Spacer(),
                          Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: const Color.fromARGB(117, 182, 182, 182),
                              border: Border.all(color: Colors.white,width: 0.5),
                              borderRadius: BorderRadius.circular(30)
                              ),
                             child: Column(
                                 children: [
                                 const Text("Max",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                                  Image.asset("assets/images/cloud_sun_pic.webp",height: 40,width: 40,),
                                  Text("${(snapshot.data["main"]["temp_max"] - 273).toStringAsFixed(0)}°",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                             ],
                           ),
                          ),
                        ],
                      )
                  ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    //color: Colors.black,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                           padding: const EdgeInsets.all(5),
                           decoration: BoxDecoration(
                           color: const Color.fromARGB(117, 182, 182, 182),
                           border: Border.all(color: Colors.white,width: 0.5),
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                            ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Humidity",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                            Image.asset("assets/images/humidity.png",height: 40,width: 40,),
                             Text("${snapshot.data["main"]["humidity"]}%",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                           padding: const EdgeInsets.all(5),
                           decoration: BoxDecoration(
                           color: const Color.fromARGB(117, 182, 182, 182),
                           border: Border.all(color: Colors.white,width: 0.5),
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                            ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Wind",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                            Image.asset("assets/images/wind.png",height: 40,width: 40,),
                             Text("${snapshot.data["wind"]["speed"]} km/h",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      ],
                    ),
                  )
                ],
              ),
                         ),
                      
                       ],
                     );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
                color: Colors.white,
              ),
            );
           }
          }
        ),
      ),
    );
  }
}




// Expanded(child: ListView.builder(
//             itemCount: 7,
//             itemBuilder: (context,index){
//             return Container(
//              // foregroundDecoration: BoxDecoration(color: Color.fromARGB(117, 182, 182, 182),),
//               //color: Color.fromARGB(117, 182, 182, 182),
//               padding: const EdgeInsets.all(10),
//               child: ListTile(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: homeColor,width: 0.5)),
//                 tileColor: const Color.fromARGB(106, 214, 247, 255),
//                 leading: const Text("Mon"),
//                 title: Row(
//                   children: [
//                     Image.asset("assets/images/cloud_sun_pic.webp",height: 40,width: 40,),
//                     const Text("Sunny",style: TextStyle(fontSize: 14),),
//                   ],
//                 ),
//                 trailing: const Text("23`",style: TextStyle(fontSize: 13),),
//               ),
//             );
//           }))



