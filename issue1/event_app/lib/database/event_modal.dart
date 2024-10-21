class Event {
  final int? id; // nullable for the case of a new event
  final String title;
  final String description;
  final String date; // You can also use DateTime if you prefer
  final String time;
  final String location;
  final int capacity;

  Event({this.id, required this.title, required this.description, required this.date, required this.time, required this.location, required this.capacity});

  // Convert an Event object into a Map object for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'location': location,
      'capacity': capacity
    };
  }

  // Convert a Map object back into an Event object
  static Event fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      location: map['location'],
      capacity: map['capacity']
    );
  }
}
