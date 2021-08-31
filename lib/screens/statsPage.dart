// ignore: file_names

// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../statistics/global_summary.dart';
import 'package:toggle_bar/toggle_bar.dart';
import '../../statistics/country_summary.dart';
import '../constants.dart';
import '../statistics/covid_service.dart';
import '../Cards.dart';
import 'dart:async';

class statisticsPage extends StatefulWidget {
  //const statisticsPage({Key? key}) : super(key: key);

  @override
  _statisticsPageState createState() => _statisticsPageState();
}

class _statisticsPageState extends State<statisticsPage> {
  CovidService covidService = new CovidService();

  Future<List<CountrySummaryModel>> fetchSummaryList;
  Future<GlobalSummaryModel> fetchGlobal;
  GlobalSummaryModel newSummary;
  List<CountrySummaryModel> countrySummary;
  var changer;

  String get _country => 'ghana';

  Future<void> tempFunction() async {
    newSummary = await covidService.getGlobalSummary();
    countrySummary = await covidService.getCountrySummary(_country);
  }

  @override
  void initState() {
    super.initState();
    fetchGlobal = covidService.getGlobalSummary();
    fetchSummaryList = covidService.getCountrySummary('ghana');
    tempFunction();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    tempFunction();
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        backgroundColor: Color(0xFF012443),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color(0xFF012443),
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [SizedBox(height: 30.0)],
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              //   child: Text(
              //     'Statistics',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //         decoration: TextDecoration.none),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ToggleBar(
                  labels: choices,
                  textColor: Colors.white,
                  selectedTabColor: Colors.white,
                  backgroundColor: Color(0xFF1E3163),
                  selectedTextColor: Colors.black,
                  borderRadius: 20,
                  labelTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  onSelectionUpdated: (index) {
                    setState(() {
                      count2 = index;
                    });
                  },
                ),
              ),
              FutureBuilder(
                future: count2 == 0 ? fetchGlobal : fetchSummaryList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NewCards(
                              color1,
                              count2 == 0 ? 'Total Confirmed' : 'Active',
                              count2 == 0
                                  ? newSummary.totalConfirmed
                                  : countrySummary[countrySummary.length - 1]
                                      .active,
                              deviceData.size.height * 0.2,
                              deviceData.size.width * 0.42),
                          NewCards(
                              color2,
                              count2 == 0 ? 'Total Deaths' : 'Death',
                              count2 == 0
                                  ? newSummary.totalDeaths
                                  : countrySummary[countrySummary.length - 1]
                                      .death,
                              deviceData.size.height * 0.2,
                              deviceData.size.width * 0.42),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NewCards(
                            color1,
                            count2 == 0 ? 'Total Confirmed' : 'Active',
                            'loading...',
                            deviceData.size.height * 0.2,
                            deviceData.size.width * 0.42),
                        NewCards(
                            color2,
                            count2 == 0 ? 'Total Deaths' : 'Death',
                            'loading...',
                            deviceData.size.height * 0.2,
                            deviceData.size.width * 0.42),
                      ],
                    ),
                  );
                },
              ),
              FutureBuilder(
                  future: count2 == 0 ? fetchGlobal : fetchSummaryList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 17.0, right: 17.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NewCards(
                                color3,
                                count2 == 0 ? 'New Confirmed' : 'death',
                                count2 == 0
                                    ? newSummary.totalDeaths
                                    : countrySummary[countrySummary.length - 1]
                                        .death,
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.285),
                            NewCards(
                                color4,
                                count2 == 0 ? 'New Deaths' : 'Confirmed',
                                count2 == 0
                                    ? newSummary.newDeaths
                                    : countrySummary[countrySummary.length - 1]
                                        .confirmed,
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.285),
                            NewCards(
                                color5,
                                count2 == 0 ? 'Total Recovered' : 'Country',
                                count2 == 0
                                    ? newSummary.totalRecovered
                                    : countrySummary[countrySummary.length - 1]
                                        .country,
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.285),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NewCards(
                                color3,
                                'New Confirmed',
                                'loading...',
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.27),
                            NewCards(
                                color4,
                                'New Deaths',
                                'loading...',
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.27),
                            NewCards(
                                color5,
                                'Total Recovered',
                                'loading...',
                                deviceData.size.height * 0.2,
                                deviceData.size.width * 0.27),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
