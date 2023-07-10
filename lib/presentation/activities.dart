import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/data/local_data_source.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';
import 'package:my_app/presentation/widget/activity_card.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<TouristicAttraction> activities = List.empty();

  @override
  void initState() {
    super.initState();
    LocalDataSource().getActivities(context).then((value) =>
        setState(() {
          activities = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            height: 600.0,
            aspectRatio: 2.0,
            enlargeCenterPage: true
        ),
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        activities.isNotEmpty
            ? ActivityCard(activity: activities[itemIndex])
            : Container());
  }
}