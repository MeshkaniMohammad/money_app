import 'package:intl/intl.dart';

final myDate = DateTime(2021, 4, 15);
final myDate2 = DateTime(2021, 4, 16);
final myDate3 = DateTime(2021, 4, 10);
List elements = [
  {
    'name': 'eBay',
    'icon': 'assets/icons/payment_icon.svg',
    'amount': '32.00',
    'date': myDate.isToday()
        ? "TODAY"
        : myDate.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate),
    'type': 'pay'
  },
  {
    'name': 'Merton Council',
    'icon': 'assets/icons/payment_icon.svg',
    'amount': '65.00',
    'date': myDate.isToday()
        ? "TODAY"
        : myDate.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate),
    'type': 'pay'
  },
  {
    'name': 'Top Up',
    'icon': 'assets/icons/topup_icon.svg',
    'amount': '34.00',
    'date': myDate.isToday()
        ? "TODAY"
        : myDate.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate),
    'type': 'topUp'
  },
  {
    'name': 'Amazon',
    'icon': 'assets/icons/payment_icon.svg',
    'amount': '527.00',
    'date': myDate2.isToday()
        ? "TODAY"
        : myDate2.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate2),
    'type': 'pay'
  },
  {
    'name': 'John Snow',
    'icon': 'assets/icons/payment_icon.svg',
    'amount': '39.00',
    'date': myDate2.isToday()
        ? "TODAY"
        : myDate2.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate2),
    'type': 'pay'
  },
  {
    'name': 'Top Up',
    'icon': 'assets/icons/topup_icon.svg',
    'amount': '200.00',
    'date': myDate2.isToday()
        ? "TODAY"
        : myDate2.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate2),
    'type': 'topUp'
  },
  {
    'name': 'Top Up',
    'icon': 'assets/icons/topup_icon.svg',
    'amount': '200.00',
    'date': myDate3.isToday()
        ? "TODAY"
        : myDate3.isYesterday()
            ? "YESTERDAY"
            : DateFormat("d MMMM").format(myDate3).toUpperCase(),
    'type': 'topUp'
  },
];

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day && now.month == this.month && now.year == this.year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return yesterday.day == this.day &&
        yesterday.month == this.month &&
        yesterday.year == this.year;
  }
}
