import 'package:flutter/material.dart';

class Event {
  int id = 0;
  String name;
  String venue = 'N/A';
  String description;
  DateTime date;
  TimeOfDay time;
  bool isReminder;
  bool isPackingReminder;
  bool isRetrieveReminder;
  String status;

  Event.create({
    required this.name,
    this.venue = 'N/A',
    required this.description,
    required this.date,
    required this.time,
    this.isReminder = false,
    this.isPackingReminder = false,
    this.isRetrieveReminder = false,
    this.status = 'Planned',
  });

  Event({
    this.id = 0,
    this.name = 'No name',
    this.venue = 'N/A',
    this.description = '',
    required this.date,
    required this.time,
    this.isReminder = false,
    this.isPackingReminder = false,
    this.isRetrieveReminder = false,
    this.status = 'Planned',
  });
}
