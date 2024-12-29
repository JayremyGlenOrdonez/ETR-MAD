import 'package:etrmad/models/borrowed_item.dart';
import 'package:etrmad/models/event_model.dart';
import 'package:get/get.dart';

RxList<Event> EVENTLIST = RxList<Event>([]);
RxList<Event> CURRENT_EVENTLIST = RxList<Event>([]);
RxList<Event> UPCOMING_EVENTLIST = RxList<Event>([]);
RxList<Event> ENDED_EVENTLIST = RxList<Event>([]);
//=======
RxList<BorrowedItem> BORROWEDLIST = RxList<BorrowedItem>([]);
RxList<BorrowedItem> PENDING_BORROWEDLIST = RxList<BorrowedItem>([]);
RxList<BorrowedItem> RETURNED_BORROWEDLIST = RxList<BorrowedItem>([]);
