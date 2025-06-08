import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sua_notify/screens/teacher/components/timetable_view.dart';

class LectureNotificationScreen extends StatelessWidget {
  const LectureNotificationScreen({super.key});

  // Sample mock data for upcoming classes
  List<Map<String, dynamic>> getUpcomingTimetables() {
    final now = DateTime.now();
    final upcoming = now.add(const Duration(minutes: 30));

    final List<Map<String, dynamic>> timetableList = [
      {
        'title': 'Machine Learning',
        'dateTime': now.add(const Duration(minutes: 20)),
        'class': 'BSc IT',
        'location': 'Room 105',
      },
      {
        'title': 'Data Mining',
        'dateTime': now.add(const Duration(minutes: 50)), // Not shown
        'class': 'BSc CS',
        'location': 'Room 201',
      },
      {
        'title': 'Ethical Hacking',
        'dateTime': now.add(const Duration(minutes: 10)),
        'class': 'BSc SE',
        'location': 'Room 109',
      },
    ];

    return timetableList.where((item) {
      final dateTime = item['dateTime'] as DateTime;
      return dateTime.isAfter(now) && dateTime.isBefore(upcoming);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final upcomingList = getUpcomingTimetables();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Upcoming Periods',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            upcomingList.isEmpty
                ? const Center(
                  child: Text('No upcoming classes within 30 minutes.'),
                )
                : ListView.builder(
                  itemCount: upcomingList.length,
                  itemBuilder: (context, index) {
                    final item = upcomingList[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TimetableViewScreen(),
                            ),
                          );
                        },
                        title: Text(item['title']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Class: ${item['class']}"),
                            Text(
                              "Time: ${DateFormat('hh:mm a').format(item['dateTime'])}",
                            ),
                            Text("Location: ${item['location']}"),
                          ],
                        ),
                        leading: const Icon(
                          Icons.notifications_active,
                          color: Colors.orange,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
