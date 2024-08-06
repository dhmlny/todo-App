// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TOdoCard extends StatelessWidget {
  final String title; //Task name
  final bool doneORnot; //Task status
  final Function changeStatus; 
  final Function deleteTask; 
  final int index; //Index of the Task in the list
  TOdoCard(
      {required this.title,
      required this.changeStatus,
      required this.deleteTask,
      required this.index,
      required this.doneORnot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 244, 0.2),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Task name 
              Text(
                title,
                style: TextStyle(
                  color: (doneORnot == false) ? Colors.white : Colors.black,
                  decoration: (doneORnot == true) ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 22,
                  ),
              ),
              Row(
                children: [
                  Icon(
                    (doneORnot == false) ? Icons.close : Icons.check,
                    color: (doneORnot == false) ? Colors.red : Colors.green,
                    size: 27,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask(index);
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                    iconSize: 27,
                    color: Colors.redAccent,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
