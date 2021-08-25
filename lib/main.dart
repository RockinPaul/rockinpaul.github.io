import 'package:auto_size_text/auto_size_text.dart';
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    final availableWidth = MediaQuery.of(context).size.width - 80.0;
    final availableHeight = MediaQuery.of(context).size.height - 80.0;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: availableWidth * 2/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      AutoSizeText(
                        'Pavel Zarudnev',
                        style: GoogleFonts.encodeSansSemiExpanded(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      AutoSizeText(
                        'Mobile developer',
                        style: GoogleFonts.encodeSansSemiExpanded(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      AutoSizeText(
                        'Hilversum, Netherlands',
                        style: GoogleFonts.encodeSansSemiExpanded(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Linkify(
                        onOpen: (link) async {
                          if (await canLaunch(link.url)) {
                            await launch(link.url);
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                        text: 'https://linkedin.com/in/pavelzarudnev',
                        style: GoogleFonts.encodeSansSemiExpanded(fontSize: 18.0),
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
                        style: GoogleFonts.encodeSansSemiExpanded(fontSize: 18.0),
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
                        style: GoogleFonts.encodeSansSemiExpanded(fontSize: 18.0),
                        // linkStyle: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: availableWidth / 3, // 1/3 of available width
                  height: 320,
                  child: Image.asset(
                    'assets/images/zarudnev_photo.jpg',
                    fit: BoxFit.contain,
                    width: 240,
                    height: 320,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            AutoSizeText(
              "I'm a mobile developer with 7 years of experience creating mobile applications using Objective-C, Swift, and Flutter. My responsibilities include working with a large number of technologies and libraries, team leading, code review, mentoring and delivery to the stores.In the most recent years of my career, I've dedicated myself to Flutter, which I consider the best thing that has happened to mobile development for the past decade.",
              style: GoogleFonts.encodeSansSemiExpanded(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
