import 'package:flutter/material.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/constants/global.dart';
import 'package:wallet_app/global_class/top_bar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const TopBar(
        topBarHeader: 'Wallet',
      ),
      const SizedBox(
        height: 35,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/png/atm_card.png'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    _buildPayContainer(
                        haderText: 'Total Pay', payValue: '30000.00'),
                    const SizedBox(
                      width: 20,
                    ),
                    _buildPayContainer(
                        haderText: 'Total Recive', payValue: '1000.00'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'All Transactions',
                    style: TextStyle(
                        color: staticWhiteColor,
                        fontFamily: 'QuicksandBold',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ResentTransaction()
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildPayContainer({String? haderText, String? payValue}) {
    return Expanded(
      child: Container(
        height: 65,
        decoration: BoxDecoration(
            color: const Color(0xff282638),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              haderText!,
              style: const TextStyle(
                  color: staticWhiteColor,
                  fontFamily: 'QuicksandBold',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              payValue!,
              style: const TextStyle(
                color: Color(0xff6683E7),
                fontFamily: 'QuicksandRegular',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResentTransaction extends StatelessWidget {
  const ResentTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
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
                          color: resentTransactionList[index]
                              ['transactionColor'] as Color,
                          fontFamily: 'QuicksandRegular',
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
