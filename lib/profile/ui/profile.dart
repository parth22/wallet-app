import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_app/constants/colours.dart';
import 'package:wallet_app/global_class/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const TopBar(
        topBarHeader: 'Profile',
      ),
      const SizedBox(
        height: 35,
      ),
      _buildProfile(context),
      const SizedBox(
        height: 50,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildListTitle(
                  leadingImage: 'assets/svg/2 Friends.svg',
                  title: 'Personal Information'),
              _buildListTitle(
                  leadingImage: 'assets/svg/document.svg',
                  title: 'Payment Preferences'),
              _buildListTitle(
                  leadingImage: 'assets/svg/wallet_profile.svg',
                  title: 'Banks & Cards'),
              _buildListTitle(
                  leadingImage: 'assets/svg/notification.svg',
                  title: 'Notifications'),
              _buildListTitle(
                  leadingImage: 'assets/svg/call.svg', title: 'Contact Us'),
              _buildListTitle(
                  leadingImage: 'assets/svg/Logout.svg', title: 'Logout'),
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xff282638),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 65,
              width: 65,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                'assets/images/Rectangle4.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'John Doe',
              style: TextStyle(
                  color: staticWhiteColor,
                  fontFamily: 'QuicksandRegular',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'John Doe123@gmail.com',
              style: TextStyle(
                  color: staticWhiteColor,
                  fontFamily: 'QuicksandRegular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTitle({String? title, String? leadingImage}) {
    return ListTile(
      leading: SvgPicture.asset(leadingImage!),
      title: Text(
        title!,
        style: const TextStyle(
            color: staticWhiteColor,
            fontFamily: 'QuicksandRegular',
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
      trailing: SvgPicture.asset('assets/svg/arrow.svg'),
    );
  }
}
