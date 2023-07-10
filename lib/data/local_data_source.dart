import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/domain/model/touristic_attraction.dart';

class LocalDataSource {

  Future<List<TouristicAttraction>> getTouristicAttractions(
      BuildContext context) async {
    var jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/attractions.json");
    var jsonData = json.decode(jsonString);
    List<TouristicAttraction> attractions = [];
    for (var attraction in jsonData) {
      attractions.add(TouristicAttraction().fromJson(attraction));
    }
    return attractions;
  }

  Future<List<TouristicAttraction>> getActivities(BuildContext context) async {
    var jsonString = await DefaultAssetBundle.of(context).loadString(
        "assets/data/activities.json");
    var jsonData = json.decode(jsonString);
    List<TouristicAttraction> activities = [];
    for (var activity in jsonData) {
      activities.add(TouristicAttraction().fromJson(activity));
    }
    return activities;
  }
}