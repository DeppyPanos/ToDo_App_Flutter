import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      //the color for our first container is the this grey shadow that has the rest of the screen when we press the button and this way we can create another one on top of it and it will allow us to have these circular edges on the top
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 40.0, left: 40.0, right: 40.0, bottom: 20.0),
              child: Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextField(
                autofocus: true,
                //an thelw -> textAlign: TextAlign.center,
                cursorColor: Colors.pinkAccent,
                decoration: InputDecoration(
                  hintText: 'Type here a new task...',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                //I don't have to use this ... controller: userInput, instead I use the onChanged
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
              child: FlatButton(
                padding: EdgeInsets.all(15.0),
                color: Colors.pinkAccent,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context,
                          listen:
                              false) //Angela didn't write listen:false and it worked
                      .addTask(newTaskTitle);
                  Navigator.pop(
                      context); //so that when we press the add button and add the task to the list to takes us back to the main screen with the list;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
