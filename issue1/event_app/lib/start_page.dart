import 'package:event_app/manager_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventUsers extends StatefulWidget {
  const EventUsers({super.key});

  @override
  State<EventUsers> createState() => _EventUsersState();
}

class _EventUsersState extends State<EventUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "E-Events App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Row(
             children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                      ),
                      child: Text(
                        "Attendees",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                ),
               Expanded(
                 child: ElevatedButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ManagerPage()),
                       );
                     },
                     style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         foregroundColor: Colors.white
                     ),
                     child: Text(
                       "Managers",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 22,
                           fontWeight: FontWeight.bold
                       ),
                     )
                 ),
               )
              ],
            ),
          )
        ],
      )
    );
  }
}
