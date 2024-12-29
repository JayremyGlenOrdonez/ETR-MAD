import 'package:etrmad/Database/db_helper.dart';
import 'package:etrmad/constant/global.dart';
import 'package:get/get.dart';

class BorrowController extends GetxController {
  @override
  void onReady() {
    refresh();
    super.onReady();
  }

  @override
  void refresh() {
    fetchAllBorrowedItems();
    fetchAllPendingBorrowedItems('Pending');
    fetchAllReturnedBorrowedItems('Returned');
  }

  void fetchAllBorrowedItems() async {
    BORROWEDLIST.value = await DbHelper.instance.fetchAllBorrowedItems();
  }

  void fetchAllPendingBorrowedItems(String status) async {
    PENDING_BORROWEDLIST.value =
        await DbHelper.instance.fetchAllBorrowedItems(status: status);
  }

  void fetchAllReturnedBorrowedItems(String status) async {
    RETURNED_BORROWEDLIST.value =
        await DbHelper.instance.fetchAllBorrowedItems(status: status);
  }
}