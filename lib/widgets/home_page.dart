import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model/task.dart';
import 'package:task_manager/pages/add_task.dart';
import 'package:task_manager/provider/task_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var tasks;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        height: size.height,
        child: Column(
          children: [
            Text(
              "My Tasks",
              style: GoogleFonts.cinzel(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Consumer<TaskProvider>(builder: (context, value, child) {
              tasks = value.getTasks;
              return Container(
                height: size.height * 0.7,
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 110, 108, 108),
                        child: ListTile(
                          title: Text(
                            tasks[index].title,
                            style: GoogleFonts.cinzel(
                                fontWeight: FontWeight.w200,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      );
                    }),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 100, 98, 98),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
