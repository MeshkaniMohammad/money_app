import 'dart:developer';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_app/controllers/balance_controller.dart';
import 'package:money_app/data/dummy_data.dart';
import 'package:money_app/res/colors.dart';
import 'package:money_app/screens/home.dart';
import 'package:money_app/widgets/action_button.dart';

class PayWho extends StatelessWidget {
  final String amount;

  const PayWho({Key key, @required this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final BalanceController _balanceController = Get.put(BalanceController());

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "MoneyApp",
                  style: GoogleFonts.montserrat(
                      color: AppColors.generalNumbersColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: _width / 3,
                ),
                GestureDetector(
                  onTap: () => Get.close(1),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: _height / 8,
          ),
          Text(
            "To who?",
            style: GoogleFonts.montserrat(
              color: AppColors.generalNumbersColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: _height / 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: TextField(
              autofocus: true,
              controller: _controller,
              onSubmitted: (val) {
                String formatedAmount = amount;
                if (amount.contains('.'))
                  formatedAmount = amount;
                else
                  formatedAmount = '$formatedAmount' + '.00';
                elements.add({
                  'name': _controller.text,
                  'icon': 'assets/icons/payment_icon.svg',
                  'amount': formatedAmount,
                  'date': DateTime.now().isToday()
                      ? "TODAY"
                      : DateTime.now().isYesterday()
                          ? "YESTERDAY"
                          : DateFormat("d MMMM").format(DateTime.now()),
                  'type': 'pay'
                });
                _balanceController.payWithAccount(double.parse(amount));
                FocusScope.of(context).unfocus();
                Get.to(() => Home());
              },
              maxLines: 1,
              style: GoogleFonts.montserrat(
                color: AppColors.generalNumbersColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              enabled: true,
            ),
          ),
          SizedBox(
            height: _height / 8,
          ),
          ActionButton(
            title: "Pay",
            onTap: () {
              String formattedAmount = amount;
              if (amount.contains('.'))
                formattedAmount = amount;
              else
                formattedAmount = '$formattedAmount' + '.00';
              elements.add({
                'name': _controller.text,
                'icon': 'assets/icons/payment_icon.svg',
                'amount': formattedAmount,
                'date': DateTime.now().isToday()
                    ? "TODAY"
                    : DateTime.now().isYesterday()
                        ? "YESTERDAY"
                        : DateFormat("d MMMM").format(DateTime.now()).toUpperCase(),
                'type': 'pay'
              });
              _balanceController.payWithAccount(double.parse(amount));
              FocusScope.of(context).unfocus();
              log(elements.toString());
              Get.to(() => Home());
            },
          ),
        ],
      ),
    );
  }
}
