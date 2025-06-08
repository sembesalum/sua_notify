import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CrHomeScreen extends StatelessWidget {
  const CrHomeScreen({super.key});

  final Color primaryColor = const Color.fromARGB(255, 41, 97, 18);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final List<Map<String, dynamic>> timetableList = [
      {
        'title': 'Software Engineering',
        'dateTime': now.add(const Duration(hours: 1)),
        'location': 'Room 104',
        'status': 'confirmed',
      },
      {
        'title': 'Database Systems',
        'dateTime': now.add(const Duration(days: 1)),
        'location': 'Room 202',
        'status': 'unconfirmed',
      },
      {
        'title': 'Artificial Intelligence',
        'dateTime': now,
        'location': 'Lab 2',
        'status': 'confirmed',
      },
    ];

    final todayClasses =
        timetableList
            .where(
              (e) =>
                  e['dateTime'].day == now.day &&
                  e['dateTime'].month == now.month &&
                  e['dateTime'].year == now.year,
            )
            .toList();

    final upcomingClasses =
        timetableList.where((e) => e['dateTime'].isAfter(now)).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
            padding: const EdgeInsets.only(left: 1, right: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Bless Noah!',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('You are Welcome', style: TextStyle(fontSize: 12)),
                  ],
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/icons/bell.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
            _buildSectionTitleRow(
              "Today's Classes",
              onShowAll: () {
                // TODO: Handle show all navigation or modal
              },
            ),
            ...todayClasses.map((e) => _buildClassCard(e)),
      
            const SizedBox(height: 5),
            _buildSectionTitleRow(
              "Upcoming Classes",
              onShowAll: () {
                // TODO: Handle show all navigation or modal
              },
            ),
            ...upcomingClasses.map((e) => _buildClassCard(e)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitleRow(
    String title, {
    required VoidCallback onShowAll,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          TextButton(
            onPressed: onShowAll,
            child: Text("Show All", style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildClassCard(Map<String, dynamic> classInfo) {
    final dateTime = classInfo['dateTime'] as DateTime;
    final timeStr = DateFormat('EEE, MMM d • hh:mm a').format(dateTime);
    final isConfirmed = classInfo['status'] == 'confirmed';

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    classInfo['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: primaryColor,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share, color: primaryColor),
                  onPressed: () {
                    // TODO: Implement share logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(timeStr),
            Text(classInfo['location']),
            const SizedBox(height: 4),
            Text(
              isConfirmed ? 'Lecturer confirmed ✅' : 'Lecturer not confirmed ❌',
              style: TextStyle(
                color: isConfirmed ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
