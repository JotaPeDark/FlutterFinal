import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;

  ProgressCard({
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
            SizedBox(height: 8),
            Text('${(progress * 100).toStringAsFixed(0)}% concluído'),
          ],
        ),
      ),
    );
  }
}
