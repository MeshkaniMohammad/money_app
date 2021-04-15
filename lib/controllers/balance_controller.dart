import 'package:get/state_manager.dart';

class BalanceController extends GetxController {
  var totalBalance = 150.25.obs;
  topUpToAccount(double topUpAmount) => totalBalance += topUpAmount;
  payWithAccount(double paymentAmount) => totalBalance -= paymentAmount;
}
