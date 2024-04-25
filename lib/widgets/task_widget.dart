import 'package:calendar_app/widgets/event_provider.dart';
import 'package:calendar_app/widgets/event_view.dart';
import 'package:calendar_app/widgets/events_data_souce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
          child: Text("No Events Found!",
              style: TextStyle(color: Colors.black, fontSize: 24)));
    }

    return SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        onTap: (details) {
          if (details.appointments == null) return;

          final event = details.appointments!.first;

          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => EventViewingPage(event: event)));
        });
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;

    return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
            color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(event.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
