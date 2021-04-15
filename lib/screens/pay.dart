import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_app/data/dummy_data.dart';
import 'package:money_app/res/colors.dart';
import 'package:money_app/screens/pay_who.dart';
import 'package:money_app/widgets/action_button.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

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
            height: _height / 10,
          ),
          Text(
            "How much?",
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
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("£",
                    style: GoogleFonts.montserrat(
                      color: AppColors.generalNumbersColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    readOnly: true,
                    maxLines: 1,
                    maxLength: 7,
                    style: GoogleFonts.montserrat(
                      color: AppColors.generalNumbersColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      hintText: "0000.00",
                      hintMaxLines: 1,
                      hintStyle: GoogleFonts.montserrat(
                        color: AppColors.hintColor.withOpacity(0.5),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      counter: Container(),
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    enabled: true,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: _height / 10,
          ),
          Container(
            color: AppColors.primaryColor,
            child: VirtualKeyboard(
                textColor: AppColors.generalNumbersColor,
                type: VirtualKeyboardType.Numeric,
                fontSize: 25,
                tapOnDelete: () {
                  if (_controller.text != null && _controller.text.length > 0) {
                    _controller.text = _controller.text.substring(0, _controller.text.length - 1);
                  }
                },
                onKeyPress: (key) {
                  if (_controller.text.length > 0 && _controller.text.length < 8) {
                    _controller.text += key.text;
                  } else if (_controller.text.length > 7) {
                  } else if (_controller.text.length == 0) {
                    _controller.text = key.text;
                  }
                }),
          ),
          SizedBox(
            height: _height / 14,
          ),
          ActionButton(
            title: "Next",
            onTap: () {
              elements.add({
                'name': _controller.text,
                'icon': 'assets/icons/payment_icon.svg',
                'amount': _controller.text,
                'date': DateTime.now().isToday()
                    ? "TODAY"
                    : DateTime.now().isYesterday()
                        ? "YESTERDAY"
                        : DateFormat("d MMMM").format(DateTime.now()),
                'type': 'topUp'
              });
              Get.to(PayWho(
                amount: _controller.text,
              ));
            },
          ),
        ],
      ),
    );
  }
}
