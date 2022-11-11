import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zarudnev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.of(context).size.width / 6;
    final verticalPadding = horizontalPadding;
    final availableWidth =
        MediaQuery.of(context).size.width - horizontalPadding * 2;

    return Scaffold(
      backgroundColor: Color(0xff303437),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            80,
            horizontalPadding,
            verticalPadding,
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Container(
                      width: availableWidth / 3,
                      height: 320.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 10.0),
                          Text(
                            'Pavel Zarudnev',
                            style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffebebec),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Mobile developer',
                            style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffebebec),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Hilversum, Netherlands',
                            style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffebebec),
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Linkify(
                            onOpen: (link) async {
                              if (await canLaunch(link.url)) {
                                await launch(link.url);
                              } else {
                                throw 'Could not launch $link';
                              }
                            },
                            text: 'https://linkedin.com/in/pavelzarudnev',
                            style: GoogleFonts.encodeSansSemiExpanded(
                                fontSize: 16.0),
                            // linkStyle: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 15.0),
                          Linkify(
                            onOpen: (link) async {
                              if (await canLaunch(link.url)) {
                                await launch(link.url);
                              } else {
                                throw 'Could not launch $link';
                              }
                            },
                            text: 'https://github.com/RockinPaul',
                            style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 16.0,
                            ),
                            // linkStyle: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 15.0),
                          SelectableLinkify(
                            onOpen: (link) async {
                              if (await canLaunch(link.url)) {
                                await launch(link.url);
                              } else {
                                throw 'Could not launch $link';
                              }
                            },
                            text: 'me@pavelzarudnev.com',
                            style: GoogleFonts.encodeSansSemiExpanded(
                              fontSize: 16.0,
                            ),
                            // linkStyle: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      width: availableWidth * 2 / 3, // 2/3 of available width
                      height: 320,
                      child: Image.asset(
                        'assets/images/zarudnev_chairman.jpg',
                        fit: BoxFit.contain,
                        width: 240,
                        height: 320,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 30.0,
                ),
                child: Text(
                  "I'm a mobile developer with 9 years of experience creating mobile applications. My responsibilities consist of following a set of well-established general aspects in software development, working with variety of technologies and libraries, conducting a code review, and providing reliable delivery pipeline for testing and distribution. In the most recent years of my career, I dedicated myself to Flutter, which I consider the best thing that has happened to mobile development for the past decade.",
                  style: GoogleFonts.encodeSansSemiExpanded(
                    fontSize: 18.0,
                    color: Color(0xffebebec),
                  ),
                ),
              ),
              Container(
                width: availableWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 30.0,
                ),
                child: Text(
                  'My skills',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.encodeSansSemiExpanded(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffebebec),
                  ),
                ),
              ),
              Container(
                width: availableWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BulletedList(
                        stringToSplit:
                            'Mobile applications development\nTeam leading\nCode review\nAgile development\nMentoring',
                      ),
                    ),
                    Expanded(
                      child: BulletedList(
                        stringToSplit:
                        'Mobile software architecture\nFlutter & Dart\nSwift & Objective-C\nSoftware distribution\nAnalytics',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BulletedList extends StatelessWidget {
  // String divided by \n.
  // For example: 'Team leading\nCode review\nAgile development\nMentoring'
  final String stringToSplit;

  const BulletedList({
    Key? key,
    required this.stringToSplit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: LineSplitter.split(
      stringToSplit,
    ).map((o) {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "• ",
              style: TextStyle(
                fontSize: 23.0,
                color: Color(0xffebebec),
              ),
            ),
            Expanded(
              child: Text(
                o,
                style: GoogleFonts.encodeSansSemiExpanded(
                  fontSize: 18.0,
                  color: Color(0xffebebec),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}
