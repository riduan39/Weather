import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  _weatherState createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You Are On",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Cox's Bazar",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text("here is 36\u00B0 C hot"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Minimum Tempreture"),
                      tileColor: Colors.teal,
                      trailing: Text("25\u00B0 C"),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Minimum Tempreture"),
                      tileColor: Colors.teal,
                      trailing: Text("36\u00B0 C"),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Minimum Tempreture"),
                      tileColor: Colors.teal,
                      trailing: Text("36\u00B0"),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Minimum Tempreture"),
                      tileColor: Colors.teal,
                      trailing: Text("36\u00B0"),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
