import 'package:flutter/material.dart';

class TimetableEntryForm extends StatefulWidget {
  const TimetableEntryForm({Key? key}) : super(key: key);

  @override
  _TimetableEntryFormState createState() => _TimetableEntryFormState();
}

class _TimetableEntryFormState extends State<TimetableEntryForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _courseCodeController;
  late TextEditingController _courseNameController;
  late TextEditingController _lecturerController;
  late TextEditingController _venueController;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  late List<bool> _selectedDays;
  late String _selectedColor;

  @override
  void initState() {
    super.initState();
    _courseCodeController = TextEditingController(text: 'INF 301');
    _courseNameController = TextEditingController(text: 'Computer Science');
    _lecturerController = TextEditingController(text: 'Dr. Churi');
    _venueController = TextEditingController(text: 'SD4');
    _startTime = TimeOfDay(hour: 9, minute: 0);
    _endTime = TimeOfDay(hour: 10, minute: 30);
    _selectedDays = List.generate(7, (index) => index == 0); // Default to Monday
    _selectedColor = 'FF4285F4'; // Default blue color
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    // Empty for UI only
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20 ,
        right: 20 ,
        top: 20 ,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Add New Class',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20 ),
            TextFormField(
              controller: _courseCodeController,
              decoration: InputDecoration(
                labelText: 'Course Code',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code),
              ),
            ),
            SizedBox(height: 15 ),
            TextFormField(
              controller: _courseNameController,
              decoration: InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.menu_book),
              ),
            ),
            SizedBox(height: 15 ),
            TextFormField(
              controller: _lecturerController,
              decoration: InputDecoration(
                labelText: 'Lecturer',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 15 ),
            TextFormField(
              controller: _venueController,
              decoration: InputDecoration(
                labelText: 'Venue',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 15 ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Start Time',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.access_time),
                      ),
                      child: Text(
                        '09:00 AM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10 ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'End Time',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.access_time),
                      ),
                      child: Text(
                        '10:30 AM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15 ),
            Text('Days of Week', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8 ),
            ToggleButtons(
              borderRadius: BorderRadius.circular(8 ),
              constraints: BoxConstraints(minWidth: 40 , minHeight: 40 ),
              isSelected: _selectedDays,
              onPressed: (int index) {
                setState(() {
                  _selectedDays[index] = !_selectedDays[index];
                });
              },
              children: const [
                Text('M'), Text('T'), Text('W'), Text('T'), Text('F'), Text('S'), Text('S'),
              ],
            ),
            SizedBox(height: 15 ),
            Text('Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8 ),
            // Simple color picker placeholder
            SizedBox(
              height: 100 ,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8 ,
                  crossAxisSpacing: 8 ,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final color = Colors.primaries[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color.value.toRadixString(16).substring(2);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8 ),
                        border: _selectedColor == color.value.toRadixString(16).substring(2)
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20 ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 97, 18),
                minimumSize: Size(double.infinity, 50 ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10 ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Add Class',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 25 ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseNameController.dispose();
    _lecturerController.dispose();
    _venueController.dispose();
    super.dispose();
  }
}