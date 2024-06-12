import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model/task.dart';
import 'package:task_manager/provider/task_provider.dart';
import 'package:task_manager/widgets/my_textbutton.dart';
import 'package:task_manager/widgets/textfields.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String cat = "education";
  int clicked = 0;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var category = [
      "education",
      "spiritual",
      "job",
      "home",
      "opportunities",
      "news"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Task",
          style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title:",
                    style: GoogleFonts.cinzel(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  MyTextField(controller: title),
                  SizedBox(height: 10),
                  Text(
                    "Description:",
                    style: GoogleFonts.cinzel(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  MyTextField(controller: description),
                  SizedBox(height: 10),
                  Text(
                    "Category: ${cat}",
                    style: GoogleFonts.cinzel(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: size.height * 0.2,
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return MyTextButton(
                            onPressed: () {
                              setState(() {
                                clicked = index;
                              });
                            },
                            name: category[index],
                            isClicked: clicked == index,
                          );
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // var come =
                        //     Provider.of<TaskProvider>(context, listen: false)
                        //         .getTasks;
                        // print(come);
                        Task task = Task(
                          title: title.text,
                          description: description.text,
                          date: DateTime.now(),
                          category: cat,
                        );

                        Provider.of<TaskProvider>(context, listen: false)
                            .addTask(task);
                        // Provider.of<TaskProvider>(context, listen: false)
                        //     .saveTasks();
                        // var result =
                        //     Provider.of<TaskProvider>(context, listen: false)
                        //         .getTasks;
                        // print(result);
                      },
                      child: Text(
                        "Add Task",
                        style: GoogleFonts.cinzel(
                            fontWeight: FontWeight.w200,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
