// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:login_signup/components/common/header_widget.dart';
import 'package:ecocicruit/pages/home/widgets/header_widget.dart';
import 'package:ecocicruit/responsive.dart';
import 'package:ecocicruit/pages/home/widgets/activity_details_card.dart';
import 'package:ecocicruit/pages/home/widgets/bar_graph_card.dart';
import 'package:ecocicruit/pages/home/widgets/line_chart_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(scaffoldKey: scaffoldKey),
              _height(context),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'General Overview',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 15 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ActivityDetailsCard(),
              _height(context),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'User Registration Overview',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 15 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              LineChartCard(),
              _height(context),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Daily Activity Overview',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 15 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BarGraphCard(),
              _height(context),
            ],
          ),
        )));
  }
}
