import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_management/data_structures/queue.dart';
import 'package:homework_management/data_structures/stack.dart';
import 'package:homework_management/display_completed_tasks.dart';
import 'package:homework_management/display_tasks.dart';

class Homework extends StatefulWidget {
  const Homework({super.key});

  @override
  State<Homework> createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  final TextEditingController _taskController = TextEditingController();

  List<dynamic> _arr = [];
  TaskQueue _hwQueue = TaskQueue(10);
  CompletedTasksStack _completedTasksStack = CompletedTasksStack(10);

  // CompletedTasksStack _completedTasksStack = CompletedTasksStack(10);

  void _addTasks(BuildContext context, Object obj) {
    _hwQueue.enqueue(obj);
    _arr = _hwQueue.getList();
    if (_hwQueue.first() == obj) _showSnackBar(context);

  }

  void removeFromStack(dynamic value) {
      _completedTasksStack.push(value);
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Submit successful!', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green, // Set background color for success
        duration:
            Duration(seconds: 2), // Duration the SnackBar will be displayed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Homework Management App',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: Text(
                "Welcome!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Homework Task ",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _taskController,
            style: TextStyle(fontSize: 28),
            decoration: InputDecoration(
              // Label text
              hintText: 'Enter your new task:', // Hint text
              hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
              border: OutlineInputBorder(
                // Outline border
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              prefixIcon: Icon(Icons.person), // Icon before the text
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      _addTasks(context, _taskController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayHW(
                                tasks: _hwQueue, complete: _completedTasksStack,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: Text(
                    "Pending Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayCompletedTasks(completeTasks: _completedTasksStack)),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
                child: Text(
                "Completed Tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
