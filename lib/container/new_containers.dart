import 'package:flutter/material.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({super.key});

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(117, 182, 182, 182),
        border: Border.all(color: Colors.white,width: 0.5),
        borderRadius: BorderRadius.circular(30)
        ),
      child: Column(
        children: [
          Text("23`",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
          Image.asset("assets/images/cloud_sun_pic.webp",height: 60,width: 60,),
          Text("11:00",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}