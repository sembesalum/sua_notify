import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CrNotification extends StatelessWidget {
  const CrNotification({super.key});

  final Color primaryColor = const Color.fromARGB(255, 41, 97, 18);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Class Cancelled',
        'message': 'Today\'s Database class has been cancelled.',
        'time': DateTime.now().subtract(const Duration(minutes: 10)),
        'isRead': false,
      },
      {
        'title': 'Room Change',
        'message': 'All class has moved to Lab 5 instead of Lab 2.',
        'time': DateTime.now().subtract(const Duration(hours: 1)),
        'isRead': true,
      },
      {
        'title': 'New Timetable Uploaded',
        'message': 'The updated timetable for week 4 has been published.',
        'time': DateTime.now().subtract(const Duration(days: 1)),
        'isRead': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
        automaticallyImplyLeading: false,
        
        foregroundColor: primaryColor,
        elevation: 0,
        title: const Text('Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final formattedTime = DateFormat('MMM d, hh:mm a').format(notification['time']);
          final isUnread = !notification['isRead'];

          return Container(
            decoration: BoxDecoration(
              color: isUnread ? const Color(0xFFF1FDF1) : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        notification['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  notification['message'],
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
