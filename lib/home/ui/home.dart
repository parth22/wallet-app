import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/constants/global.dart';
import 'package:wallet_app/global_class/top_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TopBar(
          topBarHeader: 'Home',
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Recharge & Payments',
              style: TextStyle(
                  color: staticWhiteColor,
                  fontFamily: 'QuicksandRegular',
                  fontSize: 20),
            ),
          ),
        ),
        const _RechargePaymentOptions(),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'People',
                      style: TextStyle(
                          color: staticWhiteColor,
                          fontFamily: 'QuicksandRegular',
                          fontSize: 20),
                    ),
                  ),
                ),
                _PeopleList(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Recent Transaction',
                      style: TextStyle(
                          color: staticWhiteColor,
                          fontFamily: 'QuicksandRegular',
                          fontSize: 20),
                    ),
                  ),
                ),
                _ResentTransaction(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RechargePaymentOptions extends StatelessWidget {
  const _RechargePaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 37, right: 39, top: 25),
      itemCount: paymentOptionsList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        mainAxisExtent: 78,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      paymentOptionsList[index]['primaryColor'] as Color,
                      paymentOptionsList[index]['secondaryColor'] as Color,
                    ],
                  ),
                  // color: paymentOptionsList[index]['color'] as Color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    paymentOptionsList[index]['icon'].toString(),
                    height: 55,
                    width: 55,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                paymentOptionsList[index]['name'].toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'QuicksandRegular',
                    color: staticWhiteColor),
              )
            ],
          ),
        );
      },
    );
  }
}

class _PeopleList extends StatelessWidget {
  const _PeopleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55,
              width: 55,
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
                child: SvgPicture.asset('assets/svg/add_user.svg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 60,
              child: ListView.builder(
                itemCount: peopleList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                peopleList[index]['userAvatar'].toString()),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                              color: const Color(0xff20222C), width: 1),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResentTransaction extends StatelessWidget {
  const _ResentTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: resentTransactionList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      resentTransactionList[index]['userAvatar'].toString()),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: const Color(0xff20222C), width: 1),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  resentTransactionList[index]['userName'].toString(),
                  style: const TextStyle(
                      color: staticWhiteColor,
                      fontFamily: 'QuicksandRegular',
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  resentTransactionList[index]['transactionDate'].toString(),
                  style: const TextStyle(
                      color: staticWhiteColor,
                      fontFamily: 'QuicksandRegular',
                      fontSize: 10),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    resentTransactionList[index]['transactionAmount']
                        .toString(),
                    style: const TextStyle(
                        color: staticWhiteColor,
                        fontFamily: 'QuicksandRegular',
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    resentTransactionList[index]['transactionStatus']
                        .toString(),
                    style: TextStyle(
                        color: resentTransactionList[index]['transactionColor']
                            as Color,
                        fontFamily: 'QuicksandRegular',
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
