// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:application_2/widgets/Todo-card.dart';
import 'package:application_2/widgets/counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoState extends State<Todo> {
  //List of all task
  List allTask = [
    Task(title: "gym", status: false),
    Task(title: "reading", status: false),
    Task(title: "study", status: false),
  ];

  //Add Task to the List
  addNewTask() {
    setState(() {
      allTask.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  //Delete all task
  deleteAll() {
    setState(() {
      allTask.removeRange(0, allTask.length);
    });
  }

  //Delete a specific task
  deleteTask(int taskIndex) {
    setState(() {
      allTask.remove(allTask[taskIndex]);
    });
  }

  //Change status (false or true)
  changeStatus(int taskIndex) {
    setState(() {
      allTask[taskIndex].status = !allTask[taskIndex].status;
    });
  }

  //Verify if all tasks are completed
  int calculateCompletedTask() {
    int completedTask = 0;
    allTask.forEach((item) {
      if (item.status == true) {
        completedTask++;
      }
    });
    return completedTask;
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //For keyboard error
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),

      //Add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(5),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: "ADD new Task",
                          hintStyle: TextStyle(color: Colors.black45),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          )),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.white,
      ),

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 35,
            color: Colors.redAccent,
          ),
        ],
        title: Text(
          "TO-DO",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              allTodos: allTask.length,
              allCompleted: calculateCompletedTask(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 620,
              child: ListView.builder(
                itemCount: allTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return TOdoCard(
                    title: allTask[index].title,
                    doneORnot: allTask[index].status,
                    changeStatus: changeStatus,
                    index: index,
                    deleteTask: deleteTask,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
