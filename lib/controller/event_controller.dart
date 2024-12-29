import 'package:etrmad/Database/db_helper.dart';
import 'package:etrmad/constant/global.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  @override
  void onReady() {
    refresh();
    super.onReady();
  }

  @override
  void refresh() {
    fetchAllEvents();
    fetchAllUpcomingEvents('Upcoming');
    fetchAllCurrentEvents('Current');
    fetchAllEndedEvents('Ended');
  }

  void fetchAllEvents() async {
    EVENTLIST.value = await DbHelper.instance.fetchAllEvents();
  }

  void fetchAllUpcomingEvents(String status) async {
    UPCOMING_EVENTLIST.value =
        await DbHelper.instance.fetchAllEvents(status: status);
  }

  void fetchAllCurrentEvents(String status) async {
    CURRENT_EVENTLIST.value =
        await DbHelper.instance.fetchAllEvents(status: status);
  }

  void fetchAllEndedEvents(String status) async {
    ENDED_EVENTLIST.value =
        await DbHelper.instance.fetchAllEvents(status: status);
  }
}
