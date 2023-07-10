import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/presentation/controller/about_card_controller.dart';
import 'package:my_app/presentation/controller/home_menu_label_controller.dart';
import 'package:my_app/presentation/controller/price_card_controller.dart';
import 'package:my_app/presentation/widget/about_card.dart';
import 'package:my_app/presentation/widget/home_menu_label.dart';
import 'package:my_app/presentation/widget/linear_flow_widget.dart';
import 'package:my_app/presentation/widget/price_card.dart';
import 'package:my_app/util/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeMenuLabelController homeMenuController = HomeMenuLabelController();
  HomeMenuLabelController aboutHomeMenuController = HomeMenuLabelController();
  HomeMenuLabelController photosHomeMenuController = HomeMenuLabelController();
  HomeMenuLabelController videoHomeMenuController = HomeMenuLabelController();
  HomeMenuLabelController priceHomeMenuController = HomeMenuLabelController();

  AboutCardController aboutCardController = AboutCardController();
  PriceCardController priceCardController = PriceCardController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
            height: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage("assets/images/home.jpg")),
        Positioned(
            top: 21.0,
            left: 40.0,
            child: HomeMenuLabel(
                finalLabel: Strings.menuLabelAbout,
                controller: homeMenuController)),
        Positioned(
            top: 87.0,
            left: 40.0,
            child: HomeMenuLabel(
                finalLabel: Strings.menuLabelAbout,
                controller: aboutHomeMenuController)),
        Positioned(
            top: 153.0,
            left: 40.0,
            child: HomeMenuLabel(
                finalLabel: Strings.menuLabelPhotos,
                controller: photosHomeMenuController)),
        Positioned(
            top: 220.0,
            left: 40.0,
            child: HomeMenuLabel(
                finalLabel: Strings.menuLabelVideo,
                controller: videoHomeMenuController)),
        Positioned(
            top: 286.0,
            left: 40.0,
            child: HomeMenuLabel(
                finalLabel: Strings.menuLabelPrice,
                controller: priceHomeMenuController)),
        LinearFlowWidget(
            showLabels: showMenuLabels,
            hideLabels: hideMenuLabels,
            showAboutMenuContent: showAboutMenuContent,
            showPriceMenuContent: showPriceMenuContent,
            expandTopLabel: expandTopLabel),
        AboutCard(controller: aboutCardController),
        PriceCard(controller: priceCardController)
      ],
    );
  }

  void showMenuLabels() {
    // _key5.currentState?.hideAboutCard();
    aboutHomeMenuController.expand();
    Timer(const Duration(milliseconds: 150), () {
      photosHomeMenuController.expand();
    });
    Timer(const Duration(milliseconds: 300), () {
      videoHomeMenuController.expand();
    });
    Timer(const Duration(milliseconds: 450), () {
      priceHomeMenuController.expand();
    });
  }

  void hideMenuLabels() {
    priceHomeMenuController.collapse();
    Timer(const Duration(milliseconds: 150), () {
      videoHomeMenuController.collapse();
    });
    Timer(const Duration(milliseconds: 300), () {
      photosHomeMenuController.collapse();
    });
    Timer(const Duration(milliseconds: 450), () {
      aboutHomeMenuController.collapse();
    });
  }

  void showAboutMenuContent() {
    aboutCardController.showAboutCard();
  }

  void showPriceMenuContent() {
    priceCardController.showPriceCard();
  }

  void expandTopLabel(String label) {
    homeMenuController.setLabel(label);
  }
}
