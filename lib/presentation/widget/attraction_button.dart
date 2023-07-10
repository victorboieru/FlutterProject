import 'package:flutter/material.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';

class AttractionButton extends StatefulWidget {
  const AttractionButton(
      {super.key,
      required this.attraction,
      required this.label,
      required this.width,
      required this.opacityLevelTextButton,
      required this.function});

  final TouristicAttraction attraction;
  final String label;
  final double width;
  final double opacityLevelTextButton;
  final Function function;

  @override
  State createState() => _AttractionButtonState();
}

class _AttractionButtonState extends State<AttractionButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: widget.width,
        height: 50,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.lightBlue.withOpacity(0.7)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ))),
          child: AnimatedOpacity(
            opacity: widget.opacityLevelTextButton,
            duration: const Duration(seconds: 1),
            child: Text(
              widget.label,
              maxLines: 1,
            ),
          ),
          onPressed: () {
            widget.function();
          },
        ));
  }
}
