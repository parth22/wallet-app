import 'package:flutter/material.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/bottom_nav_bar.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: staticBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute<void>(
                        builder: (BuildContext context) => const BottomNavBar(),
                      ));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color(0xff3B3D4B),
                            Color(0xff272934),
                          ],
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                            color: const Color(0xff20222C), width: 2),
                      ),
                      child: Image.asset(
                        'assets/png/back_button.png',
                      ),
                    ),
                  ),
                ]),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Pay',
              style: TextStyle(
                color: staticWhiteColor,
                fontFamily: 'QuicksandBold',
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width / 1.7,
                child: Stack(
                  children: <Widget>[
                    Center(child: Image.asset('assets/images/code.png')),
                    Center(child: Image.asset('assets/images/scan.png')),
                  ],
                ),
                // child: Text('data'),
                // color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Text(
              'Scan QR Code To Pay Or Spot\nCode To  Connect',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: staticWhiteColor.withOpacity(0.8),
                fontFamily: 'QuicksandBold',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
