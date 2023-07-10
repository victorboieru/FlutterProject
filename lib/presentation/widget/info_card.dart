import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.title,
      required this.description,
      required this.backgroundColor});

  final String title;
  final String description;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 3,
        color: backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
