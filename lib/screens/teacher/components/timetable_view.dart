import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimetableViewScreen extends StatefulWidget {
  final Map<String, dynamic>? timetable;

  const TimetableViewScreen({super.key, this.timetable});

  @override
  State<TimetableViewScreen> createState() => _TimetableViewScreenState();
}

class _TimetableViewScreenState extends State<TimetableViewScreen> {
  String selectedStatus = '';
  final TextEditingController _messageController = TextEditingController();

  void _handleAction(String status) {
    setState(() {
      selectedStatus = status;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Marked as $status.\nMessage to CR: ${_messageController.text}',
        ),
        backgroundColor: status == 'Confirmed' ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data =
        widget.timetable ??
        {
          'title': 'Software Engineering',
          'class': 'BSc IT',
          'dateTime': DateTime.now().add(const Duration(minutes: 15)),
          'location': 'Room 104',
          'lecturer': 'Dr. Mussa Mussa',
        };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: const Text(
          'Timetable Details',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Class: ${data['class']}"),
            Text("Lecturer: ${data['lecturer']}"),
            Text("Location: ${data['location']}"),
            Text(
              "Time: ${DateFormat('EEE, MMM d • hh:mm a').format(data['dateTime'])}",
            ),
            const Divider(height: 30),

            const Text(
              "Select Status:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle, color: Colors.white,),
                    label:  Text("Confirm", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () => _handleAction("Confirmed"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cancel, color: Colors.white,),
                    label: const Text("Cancel" , style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => _handleAction("Cancelled"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              "Send Message to CR:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Type your message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            if (selectedStatus.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                "Status: $selectedStatus",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      selectedStatus == "Confirmed" ? Colors.green : Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
