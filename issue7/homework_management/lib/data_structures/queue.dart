import 'dart:core';

class TaskQueue<T> {
  List<T?> _arr;
  int _size = 0;

  TaskQueue(int capacity) : _arr = List<T?>.filled(capacity, null);

  T first() {
    if (_size == 0) {
      throw StateError('Queue is empty.');
    }
    return _arr[0]!;
  }

  List<T?> getList() {
    return _arr;
  }

  T dequeue() {
    if (_size == 0) {
      throw StateError('Queue is empty.');
    }
    T temp = _arr[0]!;
    for (int i = 0; i < _size - 1; i++) {
      _arr[i] = _arr[i + 1];
    }
    _arr[_size - 1] = null; // Clear the last position
    _size--; // Decrease the size
    return temp; // Return the dequeued element
  }

  void enqueue(T obj) {
    if (_size == _arr.length) {
      _resize(); // Resize if the array is full
    }
    _arr[_size++] = obj; // Add the element and increment size
  }

  int getSize() {
    return _size; // Return the current size of the queue
  }

  void _resize() {
    List<T?> temp = _arr; // Store the old array
    _arr = List<T?>.filled(2 * temp.length, null); // Create a new array with double capacity
    for (int i = 0; i < _size; i++) {
      _arr[i] = temp[i]; // Copy elements from the old array
    }
  }
}
