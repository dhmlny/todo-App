// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  int allTodos; //All task in the list 
  int allCompleted; //Task completed

  Counter({required this.allCompleted, required this.allTodos});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 27),
      child: Text(
        "$allCompleted/$allTodos",
        style: TextStyle(
          fontSize: 44,
          color: (allCompleted == allTodos && allTodos != 0) ? Colors.green : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
