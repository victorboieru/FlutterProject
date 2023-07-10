import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';
import 'package:my_app/presentation/widget/distance_progress_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HowToReachPage extends StatefulWidget {
  const HowToReachPage({super.key, required this.attraction});

  final TouristicAttraction attraction;

  @override
  State createState() => _HowToReachPageState();
}

class _HowToReachPageState extends State<HowToReachPage>
    with SingleTickerProviderStateMixin {
  late final WebViewController controller;

  late double percentage;
  late double nextPercentage;
  late double percentageToShow;
  Timer? timer;
  late AnimationController progressAnimationController;

  @override
  void initState() {
    super.initState();
    percentage = 0.0;
    nextPercentage = 0.0;
    percentageToShow = 0.0;
    timer = null;
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.attraction.mapUrl!))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.attraction.name!),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            margin: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  DistanceProgressBar(
                      icon: Icons.directions_walk,
                      distance: widget.attraction.distance!,
                      percentageToStop: 100.0),
                  const Spacer(),
                  DistanceProgressBar(
                      icon: Icons.directions_bike,
                      distance: widget.attraction.bikeDistance!,
                      percentageToStop: calculatePercentageToStop(
                          widget.attraction.bikeDistance!)),
                  const Spacer(),
                  DistanceProgressBar(
                      icon: Icons.directions_car,
                      distance: widget.attraction.carDistance!,
                      percentageToStop: calculatePercentageToStop(
                          widget.attraction.carDistance!)),
                  const Spacer(),
                  DistanceProgressBar(
                      icon: Icons.directions_transit,
                      distance: widget.attraction.trainDistance!,
                      percentageToStop: calculatePercentageToStop(
                          widget.attraction.trainDistance!))
                ],
              ),
            ),
          ),
          Flexible(
              child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            child: Card(
                elevation: 3,
                child: WebViewWidget(
                  controller: controller,
                )),
          ))
        ],
      ),
    );
  }

  double calculatePercentageToStop(double distanceToCalculate) {
    return (distanceToCalculate * 100) / widget.attraction.distance!;
  }
}
