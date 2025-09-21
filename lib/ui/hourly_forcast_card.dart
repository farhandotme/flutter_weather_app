import 'package:flutter/material.dart';

class hourlyForcastCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final temprature;
  const hourlyForcastCard({
    super.key,
    required this.icon,
    required this.time,
    required this.temprature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Icon(icon, size: 32),
              SizedBox(height: 8),
              Text(temprature, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
