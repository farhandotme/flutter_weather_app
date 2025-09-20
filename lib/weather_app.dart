import 'package:flutter/material.dart';
import 'package:weather_app/ui/additional_items.dart';
import 'package:weather_app/ui/hourly_forcast_card.dart';

class weather_app extends StatefulWidget {
  const weather_app({super.key});
  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
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
      body: Padding(
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
                        "36.43°F",
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
                  hourlyForcastCard(),
                  hourlyForcastCard(),
                  hourlyForcastCard(),
                  hourlyForcastCard(),
                  hourlyForcastCard(),
                ],
              ),
            ),
            SizedBox(height: 20),
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
      ),
    );
  }
}
