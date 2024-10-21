import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_management/data_structures/queue.dart';
import 'package:homework_management/homework.dart';

import 'data_structures/stack.dart';

class DisplayHW extends StatefulWidget {
  final TaskQueue tasks;
  final CompletedTasksStack complete;

  const DisplayHW({super.key, required this.tasks, required this.complete});

  @override
  State<DisplayHW> createState() => _DisplayHWState();
}

class _DisplayHWState extends State<DisplayHW> {
  late List<dynamic> _mutableTasks;
  Homework hw = Homework();

  @override
  void initState() {
    super.initState();
    // Create a mutable copy of the tasks
    _mutableTasks = List.from(widget.tasks.getList());
  }

  void _removeTask(dynamic value, int index) {
    setState(() {
      print(value);
      widget.complete.push(value);
      _mutableTasks.removeAt(index); // Remove the task at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending List"),
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
                  ElevatedButton(
                    onPressed: () {
                      _removeTask(_mutableTasks[index], index); // Call method to remove the task
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Button text color
                    ),
                    child: Text(
                      'Complete',
                      style: TextStyle(
                        fontSize: 16, // Button text size
                        fontWeight: FontWeight.bold,
                      ),
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

