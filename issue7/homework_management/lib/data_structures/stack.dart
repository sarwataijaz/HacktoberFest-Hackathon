import 'dart:core';

abstract class Stack{
   int getSize();
   Object peek();
   void push(Object obj);
   Object pop();
}

class CompletedTasksStack<T> {
  List<T?> _arr;
  int _size = 0;

  CompletedTasksStack(int capacity) : _arr = List<T?>.filled(capacity, null);

  T peek() {
    if (_size == 0) {
      throw StateError('Stack is empty.');
    }
    return _arr[_size - 1]!;
  }

  void push(T obj) {
    if (_size == _arr.length) {
      _resize();
    }
    _arr[_size++] = obj;
  }

  void _resize() {
    List<T?> temp = _arr;
    _arr = List<T?>.filled(2 * temp.length, null);
    for (int i = 0; i < _size; i++) {
      _arr[i] = temp[i];
    }
  }

  bool isEmpty() {
    return _size == 0;
  }

  T pop() {
    if (_size == 0) {
      throw StateError('Stack is empty.');
    }
    T temp = _arr[--_size]!;
    _arr[_size] = null;
    return temp;
  }

  bool search(T value) {
    for (int i = 0; i < _size; i++) {
      if (_arr[i] == value) {
        return true;
      }
    }
    return false;
  }

  void displayAllTasks() {
    for (int i = 0; i < _size; i++) {
      print(_arr[i]);
    }
  }

  int getSize() {
    return _size;
  }

  List<T?> getArrayOfStack() {
    return _arr;
  }
}

