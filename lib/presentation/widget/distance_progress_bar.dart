import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/util/progress_painter.dart';

class DistanceProgressBar extends StatefulWidget {
  const DistanceProgressBar(
      {super.key,
      required this.icon,
      required this.distance,
      required this.percentageToStop});

  final IconData icon;
  final double distance;
  final double percentageToStop;

  @override
  State createState() => _DistanceProgressBarState();
}

class _DistanceProgressBarState extends State<DistanceProgressBar>
    with SingleTickerProviderStateMixin {
  late double? percentage;
  late double nextPercentage;
  late double distanceToShow;
  late Timer timer;

  @override
  void initState() {
    percentage = 0.0;
    nextPercentage = 0.0;
    distanceToShow = 0.0;
    timer = Timer.periodic(const Duration(milliseconds: 7), handleTicker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 75,
          height: 75,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CustomPaint(
              foregroundPainter: ProgressPainter(
                  defaultCircleColor: Colors.red,
                  percentageCompletedCircleColor: Colors.green,
                  completedPercentage: percentage ?? 0.0,
                  circleWidth: 7.0),
              child: Center(
                child: Icon(widget.icon),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "${widget.distance.toStringAsFixed(1)} km",
            style: const TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }

  void publishProgress() {
    setState(() {
      percentage = nextPercentage;
      nextPercentage += 1;
      distanceToShow += widget.distance / widget.percentageToStop;
      if (nextPercentage > 100) {
        percentage = 0.0;
        nextPercentage = 0.0;
        distanceToShow = 0.0;
      }
    });
  }

  void handleTicker(Timer timer) {
    if (nextPercentage < widget.percentageToStop) {
      publishProgress();
    } else {
      timer.cancel();
    }
  }
}
