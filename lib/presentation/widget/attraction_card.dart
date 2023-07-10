import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';
import 'package:my_app/presentation/attractions/how_to_reach_page.dart';
import 'package:my_app/presentation/attractions/info_page.dart';
import 'package:my_app/presentation/widget/attraction_button.dart';
import 'package:my_app/util/strings.dart';

class AttractionCard extends StatefulWidget {
  const AttractionCard({super.key, required this.attraction});

  final TouristicAttraction attraction;

  @override
  State createState() => _AttractionCardState();
}

class _AttractionCardState extends State<AttractionCard> {
  final _key = GlobalKey();

  double _widthButton1 = 0;
  double _widthButton2 = 0;
  double _widthButton3 = 0;
  double _widthButton4 = 0;
  double opacityLevel = 1.0;
  double opacityLevelTextButton = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _widthButton1 = (_key.currentContext?.size?.width ?? 0.0) - 60.0;
          opacityLevel = 0.4;
          opacityLevelTextButton = 1.0;
        });
        Timer(const Duration(milliseconds: 150), () {
          setState(() {
            _widthButton2 = _widthButton1;
          });
        });
        Timer(const Duration(milliseconds: 300), () {
          setState(() {
            _widthButton3 = _widthButton1;
          });
        });
        Timer(const Duration(milliseconds: 450), () {
          setState(() {
            _widthButton4 = _widthButton1;
          });
        });
      },
      child: Center(
        key: _key,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 1),
                child: Image.network(
                  widget.attraction.imageUrl!,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
              Positioned(
                top: 10.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue, Colors.transparent],
                          begin: Alignment.center,
                          end: Alignment.centerRight),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(widget.attraction.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic))),
              ),
              Positioned(
                  top: 100,
                  left: 30,
                  child: AttractionButton(
                      attraction: widget.attraction,
                      label: Strings.buttonLabelInfo,
                      width: _widthButton1,
                      opacityLevelTextButton: opacityLevelTextButton,
                      function: navigateToInfoScreen)),
              Positioned(
                  top: 160,
                  left: 30,
                  child: AttractionButton(
                      attraction: widget.attraction,
                      label: Strings.buttonLabelPhotos,
                      width: _widthButton2,
                      opacityLevelTextButton: opacityLevelTextButton,
                      function: navigateToHowToReachScreen)),
              Positioned(
                  top: 220,
                  left: 30,
                  child: AttractionButton(
                      attraction: widget.attraction,
                      label: Strings.buttonLabelVideo,
                      width: _widthButton3,
                      opacityLevelTextButton: opacityLevelTextButton,
                      function: navigateToHowToReachScreen)),
              Positioned(
                  top: 280,
                  left: 30,
                  child: AttractionButton(
                      attraction: widget.attraction,
                      label: Strings.buttonLabelHowToReach,
                      width: _widthButton4,
                      opacityLevelTextButton: opacityLevelTextButton,
                      function: navigateToHowToReachScreen)),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.green[700], shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.attraction.distance!.toInt().toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            const Text(
                              "km",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHowToReachScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HowToReachPage(attraction: widget.attraction)));
  }

  void navigateToInfoScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InfoPage(attraction: widget.attraction)));
  }
}
