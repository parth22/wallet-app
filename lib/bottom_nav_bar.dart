import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/home/ui/home.dart';
import 'package:wallet_app/message/ui/transfer_screen.dart';
import 'package:wallet_app/profile/ui/profile.dart';
import 'package:wallet_app/scan/ui/scan.dart';
import 'package:wallet_app/wallet/ui/wallet_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: staticBackGroundColor,
      body: Container(
        child: SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: staticBackGroundColor,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    // height: MediaQuery.of(context).size.height - 110,
                    width: MediaQuery.of(context).size.width,
                    child: _selectedItem == 0
                        ? const Home()
                        : _selectedItem == 1
                            ? const TransferScreen()
                            : _selectedItem == 2
                                ? const ScanScreen()
                                : _selectedItem == 3
                                    ? const WalletScreen()
                                    : const ProfileScreen(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomBottomNavigationBar(
                      iconList: const <String>[
                        'assets/svg/bottom/home_deactive.svg',
                        'assets/svg/bottom/message_deactive.svg',
                        'assets/png/scan.png',
                        'assets/svg/bottom/wallet_deactive.svg',
                        'assets/svg/bottom/person_deactive.svg',
                      ],
                      activeIconList: const <String>[
                        'assets/svg/bottom/home.svg',
                        'assets/svg/bottom/message.svg',
                        'assets/png/scan_select.png',
                        'assets/svg/bottom/wallet.svg',
                        'assets/svg/bottom/person.svg',
                      ],
                      onChange: (int val) {
                        setState(() {
                          _selectedItem = val;
                        });
                      },
                      defaultSelectedIndex: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      this.iconList,
      this.activeIconList,
      this.onChange});

  final int defaultSelectedIndex;
  final Function(int)? onChange;
  final List<String>? iconList;
  final List<String>? activeIconList;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<String>? _iconList = <String>[];
  List<String>? _activeIconList = <String>[];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList!;
    _activeIconList = widget.activeIconList!;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _navBarItemList = <Widget>[];

    for (int i = 0; i < _iconList!.length; i++) {
      _navBarItemList.add(buildNavBarItem(
          _iconList![i].contains('.png')
              ? Image.asset(
                  _iconList![i],
                  height: 50,
                  width: 50,
                )
              : SvgPicture.asset(_iconList![i]),
          _activeIconList![i].contains('.png')
              ? Image.asset(
                  _activeIconList![i],
                  height: 50,
                  width: 50,
                )
              : SvgPicture.asset(_activeIconList![i]),
          i));
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      color: staticBackGroundColor,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.white70.withOpacity(0.4),
                blurRadius: 3,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFF3B3D4B),
                Color(0xFF272934),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _navBarItemList,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavBarItem(Widget icon, Widget activeIcon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange!(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        // height: MediaQuery.of(context).size.height / 12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: index == _selectedIndex ? activeIcon : icon,
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path()
      ..moveTo(size.width * 0.5000000, 0)
      ..cubicTo(size.width * 0.2942378, 0, size.width * 0.1120146,
          size.height * 0.3941789, 0, size.height)
      ..lineTo(size.width, size.height)
      ..cubicTo(size.width * 0.8879865, size.height * 0.3941789,
          size.width * 0.7057622, 0, size.width * 0.5000000, 0)
      ..close();
    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff363062).withOpacity(1);
    canvas.drawPath(path, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
