import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_login/models/students_model.dart';

import '../models/post_model.dart';
import '../services/rtb_service.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool isLoading = true;
  List<Post> postList = [];
  List<Students> studentsList = [];

  // add
  Future<void> addNewPost() async {
    isLoading = false;
    setState(() {});
    Post post = Post(
        userId: "posts",
        firstname: "firstname",
        lastname: "lastname",
        date: "date",
        content: "content");

    Students students = Students(
        userId: "students",
        firstname: 'firstname',
        lastname: 'lastname',
        date: 'date',
        content: 'content');

    await RTDBService.create(path: "posts", post: post);
    await loadPost();
    isLoading = true;
    setState(() {});
  }

  // load
  Future<void> loadPost() async {
    isLoading = false;
    setState(() {});
    postList = await RTDBService.read(path: "posts");
    // studentsList = await RTDBService.read(path: "students");
  }

  // update
  Future<void> update(Post post) async {
    isLoading = false;
    setState(() {});
    await RTDBService.update(path: "posts", post: post);
    // await RTDBService.update(path: "path", post: students);
    await loadPost();
    isLoading = true;
    setState(() {});
  }

  // remove
  Future<void> remove(String key) async {
    isLoading = false;
    setState(() {});
    await RTDBService.delete(path: "posts", key: key);
    await loadPost();
    isLoading = true;
    setState(() {});
  }

  @override
  void initState() {
    loadPost().then((value) {
      isLoading = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("FACULTY"),
              ),
              Tab(
                child: Text("STUDENTS"),
              ),
              Tab(
                child: Text("BUILDINGS"),
              ),
            ],
          ),
          title: const Text(
            "PDP UNIVERSITY",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
        ),
        body: isLoading
            ? Center(
                child: ListView.builder(
                  itemCount: studentsList.length,
                  itemBuilder: (_, __) {
                    return Card(
                      child: ListTile(
                        onTap: () async {
                          Post post = Post(
                              postKey: postList[__].postKey,
                              userId: "id",
                              firstname: "Asliddin",
                              lastname: "Musulmanov",
                              date: "29.05.2024",
                              content: "content");
                          await update(post);
                          Post students = Post(
                              userId: 'id',
                              firstname: 'firstname',
                              lastname: 'lastname',
                              date: 'date',
                              content: 'content');
                          await update(students);
                        },
                        onLongPress: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text("Are you sure to delete?"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text("No"),
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () async {
                                      // await remove(postList[__].postKey!);
                                      await remove(studentsList[__].postKey!);
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        title: Text(studentsList[__].firstname),
                        subtitle: Text(studentsList[__].content),
                        trailing: Text(studentsList[__].date),
                        leading: Text(studentsList[__].userId),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await addNewPost();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
