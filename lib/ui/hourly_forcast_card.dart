import 'package:flutter/material.dart';

class hourlyForcastCard extends StatelessWidget {
  const hourlyForcastCard({super.key});
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
                "3:30",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Icon(Icons.cloud, size: 32),
              SizedBox(height: 8),
              Text('301.17', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
