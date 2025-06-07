import 'package:flutter/material.dart';
import 'package:sua_notify/screens/components/timetable_form.dart';


class CrTimetableScreen extends StatefulWidget {
  @override
  _CrTimetableScreenState createState() => _CrTimetableScreenState();
}

class _CrTimetableScreenState extends State<CrTimetableScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Monday to Friday
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
        automaticallyImplyLeading: false,
        title: Text('Timetable', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.white),
          tabs: const [
            Tab(text: 'Monday'),
            Tab(text: 'Tuesday'),
            Tab(text: 'Wednesday'),
            Tab(text: 'Thursday'),
            Tab(text: 'Friday'),
          ],
        ),
        
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(5, (index) {
          return _buildDayTimetable([], index + 1);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 41, 97, 18),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => TimetableEntryForm(), // Empty container for UI only
          );
        },
      ),
    );
  }

  Widget _buildDayTimetable(List<dynamic> entries, int dayOfWeek) {
    if (entries.isEmpty) {
      return Center(
        child: Text(
          'No classes scheduled',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Text('Day $dayOfWeek Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('0 classes',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Sample count for UI
              itemBuilder: (context, index) {
                final color = Colors.blue;

                return Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(0.3), width: 1),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        // Time Column
                        Container(
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("09:00",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text("10:30", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),

                        // Vertical Divider
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey.withOpacity(0.3),
                          margin: EdgeInsets.symmetric(horizontal: 1),
                        ),

                        // Info Column (Expanded)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Computer Science",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("CS101", style: TextStyle(fontSize: 16)),
                              Text("Dr. Smith • Room 202",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),

                        // Edit Icon
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}