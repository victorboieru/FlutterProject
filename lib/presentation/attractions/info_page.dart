import 'package:flutter/material.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';
import 'package:my_app/presentation/widget/info_card.dart';
import 'package:my_app/util/strings.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.attraction});

  final TouristicAttraction attraction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name!),
      ),
      body: ListView(
        children: [
          InfoCard(
              title: Strings.infoCardTitleAttention,
              description: attraction.warning!,
              backgroundColor: Colors.red),
          InfoCard(
              title: Strings.infoCardTitleAbout,
              description: attraction.description!,
              backgroundColor: Colors.white),
          InfoCard(
              title: Strings.infoCardTitleOpeningHours,
              description: attraction.openingHours!,
              backgroundColor: Colors.white),
          InfoCard(
              title: Strings.infoCardTitlePrices,
              description: attraction.price.toString(),
              backgroundColor: Colors.white)
        ],
      ),
    );
  }
}
