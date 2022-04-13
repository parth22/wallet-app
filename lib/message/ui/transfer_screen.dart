import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/constants/global.dart';
import 'package:wallet_app/global_class/top_bar.dart';
import 'package:wallet_app/message/ui/pay_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TopBar(
          topBarHeader: 'Transfer',
        ),
        const SizedBox(
          height: 35,
        ),
        _buildTabBar(),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildSerchFiled(),
                _buildUpiList(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Contacts',
                        style: TextStyle(
                            color: staticWhiteColor,
                            fontFamily: 'QuicksandBold',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: staticWhiteColor.withOpacity(0.5),
                          fontFamily: 'QuicksandRegular',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildContactList()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: TabBar(
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: Color(0xFF6683E7)),
              insets: EdgeInsets.symmetric(horizontal: 40)),
          unselectedLabelColor: staticWhiteColor,
          labelColor: staticTabBarColor,
          indicatorWeight: 10,
          tabs: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF3B3D4B),
                      Color(0xFF272934),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              height: 60,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Pay',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'QuicksandBold', fontSize: 16),
                ),
              ),
            ),
            const Text(
              'Request',
              style: TextStyle(fontFamily: 'QuicksandBold', fontSize: 16),
            )
          ]),
    );
  }

  Widget _buildSerchFiled() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF282638),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            prefixIcon: Container(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                'assets/svg/search.svg',
              ),
            ),
            hintText: 'Search People or UPI ID',
            hintStyle: TextStyle(
                fontFamily: 'QuicksandBold',
                fontSize: 14,
                color: staticWhiteColor.withOpacity(0.3))),
      ),
    );
  }

  Widget _buildUpiList() {
    return Container(
      padding: const EdgeInsets.only(left: 39),
      height: 100,
      child: ListView.builder(
        itemCount: upiList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 39),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            upiList[index]['tranferAvatar'].toString()),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border:
                          Border.all(color: const Color(0xff20222C), width: 1),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(upiList[index]['bankName'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'QuicksandBold',
                          fontSize: 12,
                          color: staticWhiteColor))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: payTransactionList.length,
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
                      payTransactionList[index]['userAvatar'].toString()),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: const Color(0xff20222C), width: 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(payTransactionList[index]['userName'].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: staticWhiteColor)),
                const SizedBox(
                  height: 6,
                ),
                Text(payTransactionList[index]['userMobileNumber'].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'QuicksandRegular',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: staticWhiteColor)),
              ],
            ),
            const Spacer(),
            MaterialButton(
              color: const Color(0xff3B3D4B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              onPressed: () {
                Navigator.of(context).push<void>(MaterialPageRoute<void>(
                  builder: (BuildContext context) => PaymentScreen(),
                ));
              },
              child: const Text('Pay',
                  style: TextStyle(
                      fontFamily: 'QuicksandBold',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: staticWhiteColor)),
            )
          ],
        );
      },
    );
  }
}
