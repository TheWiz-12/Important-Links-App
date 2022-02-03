import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LinkApp(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LinkApp extends StatefulWidget {
  const LinkApp({Key? key}) : super(key: key);

  @override
  _LinkAppState createState() => _LinkAppState();
}

const String _url1 = 'https://academia.srmist.edu.in';
const String _url2 =
    'https://drive.google.com/file/d/1GwK6NMXiXxO8zLo7zhzXtH_hUdXymFhN/view?usp=sharing';
bool gitvalidate = false;
String gitval = '';
String _url3 = 'https://github.com/' + gitval;
String linkedin = '';
String _url4 = 'https://www.linkedin.com/in/' + linkedin + '/';
String _url5 = 'https://www.ilovepdf.com';

class _LinkAppState extends State<LinkApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Important Links"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Academia'),
                  onPressed: () async {
                    if (!await launch(_url1)) throw 'Could not launch $_url1';
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('F1 Time Table'),
                  onPressed: () async {
                    if (!await launch(_url2)) throw 'Could not launch $_url2';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    icon: FaIcon(FontAwesomeIcons.github),
                    border: OutlineInputBorder(),
                    labelText: 'Github Username',
                    hintText: 'Enter your Github Username',
                    //   errorText:
                    //       gitvalidate ? 'This field cannot be left empty' : null,
                  ),
                  onChanged: (value) {
                    gitval = value;
                  },

                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                child: ElevatedButton(
                  child: const Text('Open Github'),
                  onPressed: () async {
                    if (!await launch(_url3)) throw 'Could not launch $_url3';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      border: OutlineInputBorder(),
                      labelText: 'LinkedIn Username',
                      hintText: 'Enter the text after Linkedin.com/in/',
                    ),
                    onChanged: (text) {
                      linkedin = text;
                    }),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(2),
                child: ElevatedButton(
                  child: const Text('Open LinkedIn'),
                  onPressed: () async {
                    if (!await launch(_url4)) throw 'Could not launch $_url4';
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  child: const Text('Modify your pdf'),
                  onPressed: () async {
                    if (!await launch(_url5)) throw 'Could not launch $_url5';
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Note : To change your usernames of github and LinkedIn, kindly close the app and open it again.',
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Created by ~sks',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ));
  }
}
// Future openBrowserUrl({
//   required String url,
//   bool inApp = false,
// }) async {
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: true,
//       forceWebView: inApp,
//       enableJavaScript: true,
//     );
//   }
// }
