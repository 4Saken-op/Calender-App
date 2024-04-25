import 'package:calendar_app/widgets/event.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];
  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;
  List<Event> get eventsOfSelectedDate => _events;

  void addEvnt(Event event) {
    events.add(event);
    notifyListeners();
  }
}
