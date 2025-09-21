import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/additional_items.dart';
import 'package:weather_app/ui/hourly_forcast_card.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;

class weather_app extends StatefulWidget {
  const weather_app({super.key});
  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  String uri =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/guwahati?unitGroup=us&key=N892JB9RPNDFLSKB7G7UD2ZFX&contentType=json";

  Future<Map<String, dynamic>> get_weather_data() async {
    try {
      final res = await http.get(Uri.parse(uri));
      if (res.statusCode == "(failed)net::ERR_NAME_NOT_RESOLVED") {
        throw "something went wrong";
      }
      var data = json.decode(res.body);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder(
        future: get_weather_data(),
        builder: (context, snapshot) {
          print("error is : ${snapshot.error} ");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something Went Wrong 😕",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          final data = snapshot.data;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main card------
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "${data?["days"][0]["temp"]} °F",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Icon(Icons.cloud, size: 64),
                          const SizedBox(height: 20),
                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // weather card forcast---------
                const Text(
                  "Weather Forcast",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),
                // cards-------
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      hourlyForcastCard(
                        icon: WeatherIcons.cloud,
                        temprature: "301.00",
                        time: "1:00",
                      ),
                      hourlyForcastCard(
                        icon: WeatherIcons.cloud,
                        temprature: "302.10",
                        time: "2:00",
                      ),
                      hourlyForcastCard(
                        icon: WeatherIcons.day_sunny,
                        temprature: "339.00",
                        time: "3:00",
                      ),
                      hourlyForcastCard(
                        icon: WeatherIcons.cloud,
                        temprature: "243.00",
                        time: "4:00",
                      ),
                      hourlyForcastCard(
                        icon: WeatherIcons.rain,
                        temprature: "224.00",
                        time: "5:00",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Additional information
                Text(
                  "Additional Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    additional_items(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "91",
                    ),
                    additional_items(
                      icon: Icons.air,
                      label: "Wind speed",
                      value: "7.5",
                    ),
                    additional_items(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "1000",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
