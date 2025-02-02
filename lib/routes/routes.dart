import 'package:epg_viewer/routes/routes_name.dart';
import 'package:epg_viewer/screens/home/view/home.dart';
import 'package:epg_viewer/screens/program_screen/view/program_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  RoutesNames.home: (context) => const Home(),
  RoutesNames.programScreen: (context) => const ProgramScreen(),
};
