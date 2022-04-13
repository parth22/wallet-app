import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constants/colours.dart';

class TopBar extends StatelessWidget {
  const TopBar({this.topBarHeader});
  final String? topBarHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
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
                border: Border.all(color: const Color(0xff20222C), width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  'assets/svg/category.svg',
                ),
              ),
            ),
          ),
          Text(
            topBarHeader!,
            style: const TextStyle(
                color: staticWhiteColor,
                fontFamily: 'QuicksandBold',
                fontSize: 20),
          ),
          GestureDetector(
            onTap: () {},
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
                border: Border.all(color: const Color(0xff20222C), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset('assets/svg/notification.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget backbutton(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
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
              border: Border.all(color: const Color(0xff20222C), width: 2),
            ),
            child: Image.asset(
              'assets/png/back_button.png',
            ),
          ),
        ),
      ]);
}
