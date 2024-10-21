import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/database_helper.dart';
import 'database/event_modal.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final List<Event> _events = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    List<Event> events = await _databaseHelper.getEvents();
    setState(() {
      _events.clear();
      _events.addAll(events);
    });
  }

  // Function to handle adding a new event
  Future<void> _addEvent() async {
    final event = Event(
      title: _titleController.text,
      description: _descriptionController.text,
      date: _dateController.text,
      time: _timeController.text,
      location: _locationController.text,
      capacity: int.tryParse(_capacityController.text) ?? 0, // Safely parse capacity
    );

    await _databaseHelper.insertEvent(event); // Insert the event into the database
    _loadEvents(); // Reload the events list
    _clearFields(); // Clear the input fields
  }

  void _clearFields() {
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
    _locationController.clear();
    _capacityController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                    size: 22,
                  ),
                ),
                Center(
                  child: Text(
                    "Create an event",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Text(
              "Title ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
            //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'Enter Title of the Event:', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            Text(
              "Description ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'Enter Description of the Event:', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            Text(
              "Date ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'Enter Date of the Event:', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            Text(
              "Time ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'Enter Time of the Event:', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            Text(
              "Location ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'e.g: physical and virtual', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            Text(
              "Capacity ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: _capacityController,
              decoration: InputDecoration(
                //    labelText: 'Enter Title of the Event:', // Label text
                hintText: 'Enter capacity', // Hint text
                border: OutlineInputBorder( // Outline border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                prefixIcon: Icon(Icons.person), // Icon before the text
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ManagerPage()),
                  // );
                  _addEvent();
                  for (var event in _events) {
                    print('Title: ${event.title}');
                    print('Description: ${event.description}');
                    print('Date: ${event.date}');
                    print('Time: ${event.time}');
                    print('Location: ${event.location}');
                    print('Capacity: ${event.capacity}');
                    print('---'); // Separator for clarity
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
