import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './mvvm/view-models/student_info_view_model.dart';

class Assignment02 extends StatelessWidget {

  final ManageStudentData manageStudentData = Get.put(ManageStudentData());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Assignment02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Management")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
            TextField(
              controller: idController,
              decoration: const InputDecoration(hintText: "Enter ID"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Enter Description"),
            ),
            ElevatedButton(
              onPressed: () {
                manageStudentData.addStudent(
                  nameController.text,
                  idController.text,
                  descriptionController.text,
                );
                nameController.clear();
                idController.clear();
                descriptionController.clear();
              },
              child: const Text("Update List"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                manageStudentData.fetchStudents();
              },
              child: const Text("View Users"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: manageStudentData.students.length,
                  itemBuilder: (context, index) {
                    final student = manageStudentData.students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text("ID: ${student.id}\nDescription: ${student.description}"),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
