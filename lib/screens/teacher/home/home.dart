import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sua_notify/screens/teacher/components/timetable_view.dart';

class LectureHomeScreen extends StatefulWidget {
  const LectureHomeScreen({super.key});

  @override
  State<LectureHomeScreen> createState() => _LectureHomeScreenState();
}

class _LectureHomeScreenState extends State<LectureHomeScreen> {
  final Color primaryColor = const Color.fromARGB(255, 41, 97, 18);
  DateTime selectedDate = DateTime.now();
  String? selectedClass;

  final List<String> allClasses = ['BSc IT', 'BSc CS', 'BSc EIM'];

  final List<Map<String, dynamic>> timetableList = [
    {
      'title': 'Software Engineering',
      'dateTime': DateTime.now(),
      'class': 'BSc IT',
      'status': 'pending',
    },
    {
      'title': 'Project Management',
      'dateTime': DateTime.now(),
      'class': 'BSc EIM',
      'status': 'pending',
    },
    {
      'title': 'UI/UX Design',
      'dateTime': DateTime.now(),
      'class': 'BSc CS',
      'status': 'pending',
    },
    {
      'title': 'Artificial Intelligence',
      'dateTime': DateTime.now(),
      'class': 'BSc CS',
      'status': 'confirmed',
    },
    {
      'title': 'Cyber Security',
      'dateTime': DateTime.now(),
      'class': 'BSc IT',
      'status': 'confirmed',
    },
    {
      'title': 'Mobile App Dev',
      'dateTime': DateTime.now(),
      'class': 'BSc EIM',
      'status': 'confirmed',
    },
    {
      'title': 'Database Systems',
      'dateTime': DateTime.now(),
      'class': 'BSc IT',
      'status': 'canceled',
    },
    {
      'title': 'Networks',
      'dateTime': DateTime.now(),
      'class': 'BSc EIM',
      'status': 'canceled',
    },
    {
      'title': 'Cloud Computing',
      'dateTime': DateTime.now(),
      'class': 'BSc     EIM',
      'status': 'canceled',
    },
  ];

  List<Map<String, dynamic>> getFilteredTimetables(String status) {
    return timetableList.where((item) {
      final sameDate =
          DateFormat('yyyy-MM-dd').format(item['dateTime']) ==
          DateFormat('yyyy-MM-dd').format(selectedDate);
      final sameClass = selectedClass == null || item['class'] == selectedClass;
      return item['status'] == status && sameDate && sameClass;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pendingList = getFilteredTimetables('pending');
    final confirmedList = getFilteredTimetables('confirmed');
    final canceledList = getFilteredTimetables('canceled');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // FILTERS: FIRST DESIGN
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Dr Mussa Mussa!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('You are Welcome', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      size: 24,
                      color: Colors.black, // Optional: set color
                    ),
                    onPressed: () {
                      // Add refresh logic here
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 18),
                          const SizedBox(width: 8),
                          Text(DateFormat('dd MMM yyyy').format(selectedDate)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    hint: const Text('Select Class'),
                    value: selectedClass,
                    items:
                        allClasses
                            .map(
                              (cls) => DropdownMenuItem(
                                value: cls,
                                child: Text(cls),
                              ),
                            )
                            .toList(),
                    onChanged: (value) => setState(() => selectedClass = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // PENDING
            buildStatusSection('Pending', Colors.orange, pendingList),
            const SizedBox(height: 24),

            // CONFIRMED
            buildStatusSection('Confirmed', Colors.green, confirmedList),
            const SizedBox(height: 24),

            // CANCELED
            buildStatusSection('Canceled', Colors.red, canceledList),
          ],
        ),
      ),
    );
  }

  Widget buildStatusSection(
    String title,
    Color color,
    List<Map<String, dynamic>> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title Classes',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Show All')),
          ],
        ),
        const SizedBox(height: 6),
        if (items.isEmpty)
          const Text('No classes found for this status.')
        else
          ...items.take(3).map((item) => buildCard(item)),
      ],
    );
  }

  Widget buildCard(Map<String, dynamic> item) {
    Color statusColor;
    switch (item['status']) {
      case 'pending':
        statusColor = Colors.orange;
        break;
      case 'confirmed':
        statusColor = Colors.green;
        break;
      case 'canceled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TimetableViewScreen()),
          );
        },
        title: Text(item['title']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('EEE, MMM d – hh:mm a').format(item['dateTime'])),
            Text("Class: ${item['class']}"),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            item['status'].toUpperCase(),
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
