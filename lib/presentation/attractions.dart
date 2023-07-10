import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/data/local_data_source.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';
import 'package:my_app/presentation/widget/attraction_card.dart';

final List<String> titles = ['Home', 'Attractions', 'Activities', 'Contact'];

int currentIndex = 0;

class AttractionsPage extends StatefulWidget {
  const AttractionsPage({super.key});

  @override
  State<AttractionsPage> createState() => _AttractionsPageState();
}

class _AttractionsPageState extends State<AttractionsPage> {
  List<TouristicAttraction> attractions = List.empty();

  @override
  void initState() {
    super.initState();

    LocalDataSource().getTouristicAttractions(context).then((value) => setState(() {
          attractions = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            height: 600.0,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              currentIndex = index;
            }),
        itemCount: attractions.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            attractions.isNotEmpty
                ? AttractionCard(attraction: attractions[itemIndex])
                : Container());
  }
}
