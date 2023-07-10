import 'package:flutter/material.dart';
import 'package:my_app/presentation/controller/price_card_controller.dart';
import 'package:my_app/util/strings.dart';

class PriceCard extends StatefulWidget {
  const PriceCard({super.key, required this.controller});

  final PriceCardController controller;

  @override
  State<PriceCard> createState() => PriceCardState();
}

class PriceCardState extends State<PriceCard> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1),
      end: Offset.zero
  ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear
  ));

  @override
  void initState() {
    widget.controller.addListener(() {
      showPriceCard();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 15.0),
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        color: Colors.white.withOpacity(0.8),
        child: const Text(
          Strings.priceContent,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30
          ),
        ),
      ),
    );
  }

  void showPriceCard() {
    _controller.forward();
  }
}
