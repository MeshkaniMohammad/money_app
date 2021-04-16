import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_app/controllers/balance_controller.dart';
import 'package:money_app/data/dummy_data.dart';
import 'package:money_app/res/colors.dart';
import 'package:money_app/widgets/action_card.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final BalanceController _balanceController = Get.put(BalanceController());
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _width,
                height: _height / 3,
                color: AppColors.primaryColor,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "MoneyApp",
                        style: GoogleFonts.montserrat(
                            color: AppColors.generalNumbersColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: _height / 20,
                      ),
                      Obx(
                        () => Text(
                          "£ ${_balanceController.totalBalance}",
                          style: GoogleFonts.montserrat(
                              color: AppColors.generalNumbersColor,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height / 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Recent Activity",
                  style: GoogleFonts.montserrat(
                    color: AppColors.generalBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GroupedListView<dynamic, String>(
                    elements: elements,
                    groupBy: (element) => element['date'],
                    groupComparator: (value1, value2) => value2.compareTo(value1),
                    itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    groupSeparatorBuilder: (String value) => Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                      child: Text(value,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            color: AppColors.dateColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    itemBuilder: (c, element) {
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        leading: SvgPicture.asset(element['icon']),
                        minLeadingWidth: 10,
                        tileColor: Colors.white,
                        title: Text(element['name'],
                            style: GoogleFonts.montserrat(
                              color: AppColors.generalBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                        trailing: Text(
                          element['type'] == 'topUp' ? "+${element['amount']}" : element['amount'],
                          style: GoogleFonts.montserrat(
                            color: element['type'] == 'topUp'
                                ? AppColors.primaryColor
                                : AppColors.generalBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: (_height / 3) - 50,
            child: ActionCard(),
          ),
        ],
      ),
    );
  }
}
