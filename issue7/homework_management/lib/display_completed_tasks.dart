import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_structures/stack.dart';

class DisplayCompletedTasks extends StatefulWidget {
  final CompletedTasksStack completeTasks;

  const DisplayCompletedTasks({super.key, required this.completeTasks});

  @override
  State<DisplayCompletedTasks> createState() => _DisplayCompletedTasksState();
}

class _DisplayCompletedTasksState extends State<DisplayCompletedTasks> {

  late List<dynamic> _mutableTasks;

  @override
  void initState() {
    super.initState();
    // Create a mutable copy of the tasks
    _mutableTasks = widget.completeTasks.getArrayOfStack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Tasks"),
      ),
      body: ListView.builder(
        itemCount: _mutableTasks.length,
        itemBuilder: (context, index) {
          if (_mutableTasks[index] != null) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Margin around each item
              padding: EdgeInsets.all(12.0), // Padding inside each item
              decoration: BoxDecoration(
                color: Colors.white, // Background color for each item
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes the button to the right
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        _mutableTasks[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // Displaying each task
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(

            );
          }
        },
      ),
    );
  }
}
