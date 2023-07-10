import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/util/strings.dart';

class LinearFlowWidget extends StatefulWidget {
  const LinearFlowWidget(
      {super.key,
      required this.showLabels,
      required this.hideLabels,
      required this.showAboutMenuContent,
      required this.showPriceMenuContent,
      required this.expandTopLabel});

  final Function showLabels;
  final Function hideLabels;
  final Function showAboutMenuContent;
  final Function showPriceMenuContent;
  final Function expandTopLabel;

  @override
  State createState() => _LinearFlowWidgetState();
}

class _LinearFlowWidgetState extends State<LinearFlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
        delegate: FlowMenuDelegate(controller),
        children: <IconData>[
          Icons.menu,
          Icons.description,
          Icons.photo_album,
          Icons.video_collection,
          Icons.money
        ].map(buildItem).toList());
  }

  Widget buildItem(IconData icon) => FloatingActionButton(
      elevation: 10,
      // tooltip: getTooltip(icon.codePoint),
      // backgroundColor: Colors.lightBlue.withOpacity(0.7),
      backgroundColor: Colors.lightBlue,
      splashColor: Colors.black,
      child: Icon(icon, color: Colors.white, size: 20),
      onPressed: () {
        switch (icon.codePoint) {
          case 57791:
            widget.showAboutMenuContent();

            Timer(const Duration(milliseconds: 600), () {
              controller.reverse();
              widget.expandTopLabel(Strings.menuLabelAbout);
            });
            widget.hideLabels();
            break;
          case 58549:
            break;
          case 59045:
            break;
          case 58360:
            widget.showPriceMenuContent();

            Timer(const Duration(milliseconds: 600), () {
              controller.reverse();
              widget.expandTopLabel(Strings.menuLabelPrice);
            });
            widget.hideLabels();
            break;
          case 58332:
            if (controller.isCompleted) {
              Timer(const Duration(milliseconds: 600), () {
                controller.reverse();
              });
              widget.hideLabels();
            } else {
              controller.forward().whenComplete(() => {widget.showLabels()});
            }
        }
      });
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate(this.controller) : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final childSize = context.getChildSize(0)!.width;
    for (int i = context.childCount - 1; i >= 0; i--) {
      const margin = 10;
      final dx = ((childSize + margin) * i * controller.value) + margin;
      context.paintChild(i, transform: Matrix4.translationValues(10, dx, 0));
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
