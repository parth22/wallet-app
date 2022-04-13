import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: staticBackGroundColor,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Cashless Payment',
            style: TextStyle(
                color: staticWhiteColor,
                fontFamily: 'QuicksandRegular',
                fontSize: 26),
          ),
        ),
        backgroundColor: staticBackGroundColor, // status bar color
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Cashless payment systems offer your customers a simple,'
                  'efficient and safe way to settle on-line purchases',
                  style: TextStyle(
                    color: staticWhiteColor.withOpacity(0.8),
                    fontFamily: 'QuicksandLight',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 80,
              ),
              // Image.asset('assets/images/welcome.png'),
              const SizedBox(
                height: 80,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Click ',
                  style: TextStyle(
                    color: staticWhiteColor,
                    fontFamily: 'QuicksandLight',
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Get Started',
                      style: TextStyle(
                        color: staticWhiteColor,
                        fontFamily: 'QuicksandBold',
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' Button to Continue,',
                      style: TextStyle(
                        color: staticWhiteColor,
                        fontFamily: 'QuicksandLight',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xff272934), Color(0xff3B3D4B)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const BottomNavBar(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        color: staticWhiteColor,
                        fontFamily: 'QuicksandRegular',
                        fontSize: 18),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
