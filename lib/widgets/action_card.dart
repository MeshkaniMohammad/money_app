import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/screens/pay.dart';
import 'package:money_app/screens/topup.dart';

class ActionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionTile(
                'assets/icons/phone_icon.svg',
                "Pay",
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Pay();
                      });
                },
              ),
              ActionTile(
                'assets/icons/wallet_icon.svg',
                "Top up",
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return TopUp();
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const ActionTile(this.iconPath, this.text, {Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath),
          Text(
            text,
          )
        ],
      ),
    );
  }
}
