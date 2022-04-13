import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/constants/global.dart';
import 'package:wallet_app/global_class/top_bar.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: staticBackGroundColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                backbutton(context),
                const SizedBox(
                  height: 30,
                ),
                _payContainer(context),
                const SizedBox(
                  height: 20,
                ),
                const Text('From',
                    style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: staticWhiteColor)),
                const SizedBox(
                  height: 20,
                ),
                _buildBankDetail(context),
                const SizedBox(
                  height: 59,
                ),
                _addNoteTextfiled(context),
              ],
            ),
          ),
          const Spacer(),
          _buildKeyBoard(context)
        ],
      ),
    );
  }

  Widget _addNoteTextfiled(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(45),
                borderSide: const BorderSide(color: Colors.transparent)),
            fillColor: const Color(0xFF282638),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            hintText: 'Add Note',
            hintStyle: TextStyle(
                fontFamily: 'QuicksandBold',
                fontSize: 14,
                color: staticWhiteColor.withOpacity(0.3))),
      ),
    );
  }

  Widget _buildKeyBoard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.9,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF3B3D4B),
              Color(0xFF272934),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 50,
        ),
        itemCount: numKeyBoard.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 40,
              child: Center(
                  child: numKeyBoard[index]['num'] is String &&
                          numKeyBoard[index]['num'] != '.'
                      ? SvgPicture.asset('assets/svg/arrow_left.svg')
                      : Text(
                          numKeyBoard[index]['num'].toString(),
                          style: const TextStyle(
                              fontFamily: 'QuicksandBold',
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: staticWhiteColor),
                        )),
            ),
          );
        },
      ),
    );
  }

  Widget _payContainer(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xff282638),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/Rectangle1.png'),
            const SizedBox(
              width: 15,
            ),
            const Text('Pay To Olivia',
                style: TextStyle(
                    fontFamily: 'QuicksandBold',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: staticWhiteColor)),
            const Spacer(),
            Container(
              height: 42,
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1F1D2B),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text('\$100.00',
                    style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: staticWhiteColor)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBankDetail(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0xff282638),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Row(
          children: <Widget>[
            Image.asset('assets/png/wallet_data.png'),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: const <Widget>[
                Text('Central Bank Of India',
                    style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: staticWhiteColor)),
                SizedBox(
                  height: 6,
                ),
                Text('* * * * * * * * 9544',
                    style: TextStyle(
                        fontFamily: 'QuicksandRegular',
                        fontSize: 12,
                        color: staticWhiteColor,
                        fontWeight: FontWeight.w100))
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: staticWhiteColor,
                ))
          ],
        ),
      ),
    );
  }
}
