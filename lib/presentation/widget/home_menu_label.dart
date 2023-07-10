import 'package:flutter/material.dart';
import 'package:my_app/presentation/controller/home_menu_label_controller.dart';

class HomeMenuLabel extends StatefulWidget {
  const HomeMenuLabel(
      {super.key, required this.finalLabel, required this.controller});

  final String finalLabel;
  final HomeMenuLabelController controller;

  @override
  State<HomeMenuLabel> createState() => HomeMenuLabelState();
}

class HomeMenuLabelState extends State<HomeMenuLabel> {
  String label = "";
  double width = 0.0;

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.isExpanded) {
        collapse();
      } else {
        expand();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      onEnd: () {
        if (width != 0) {
          _setLabelText();
        }
      },
      width: width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.lightBlue],
              begin: Alignment.centerLeft,
              end: Alignment(-0.6, 0.0)),
          borderRadius: BorderRadius.circular(30.0)),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  void _setLabelText() {
    setState(() {
      label = widget.controller.label.isEmpty
          ? widget.finalLabel
          : widget.controller.label;
    });
  }

  void expand() {
    setState(() {
      width = 150.0;
    });
  }

  void collapse() {
    setState(() {
      label = "";
      width = 0;
    });
  }
}
