import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<weather> {
  var cityname,
      maintemp,
      min,
      max,
      humidity,
      pressure,
      sunrise,
      sunset,
      timezone,
      country;

  Future getWeather() async {
    final respone = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=dhaka&units=metric&appid=3d3d4c2b7454452cbd8e1cb7b6fc56fb"));

    var showData = jsonDecode(respone.body);

    setState(() {
      this.cityname = showData["name"];
      this.maintemp = showData["main"]["temp"];
      this.min = showData["main"]["temp_min"];
      this.max = showData["main"]["temp_max"];
      this.humidity = showData["main"]["humidity"];
      this.pressure = showData["main"]["pressure"];
      this.sunrise = showData["sys"]["sunrise"];
      this.sunset = showData["sys"]["sunset"];
      this.timezone = showData["sys"]["timezone"];
      this.country = showData["sys"]["country"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(fontFamily: "azonix"),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 10,
                color: Colors.tealAccent,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You Are On",
                              style:
                                  TextStyle(fontSize: 25, fontFamily: "azonix"),
                            ),
                            SizedBox(width: 10),
                            Text(
                              cityname != null
                                  ? cityname.toString()
                                  : "Cox's Bazar",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        maintemp != null
                            ? "here is "+maintemp.toString()+"\u00B0 C"
                            : "here is 36\u00B0 C hot",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Time : 10:22 AM",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "azonix"),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(children: [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.temperatureLow),
                    title: Text(
                      "Minimum Tempreture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(
                      min != null ? min.toString() : "20\u00B0 C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.temperatureHigh),
                    title: Text(
                      "Maximum Tempreture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(
                      max != null ? max.toString() : "36\u00B0 C",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerEmpty),
                    title: Text(
                      "Pressure",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(
                      pressure != null ? pressure.toString() : "1017",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.phoneAlt),
                    title: Text(
                      "Humidity",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(
                      humidity != null ? humidity.toString() : "78",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      "Sunrise",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(
                      sunrise != null ? sunrise.toString() :"2.06",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      "Sunset",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    tileColor: Colors.teal,
                    trailing: Text(

                      sunset != null ? sunset.toString() :"2.06",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
