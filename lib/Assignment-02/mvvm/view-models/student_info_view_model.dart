import 'package:get/get.dart';
import '../models/student_info_data_structure.dart';
import '../../database-helper.dart';

class ManageStudentData extends GetxController {
  final RxList<StudentDataStructure> _students = <StudentDataStructure>[].obs;

  List<StudentDataStructure> get students => _students;

  void addStudent(String name, String id, String description) {
    final student = StudentDataStructure(
      name: name,
      id: id,
      description: description,
    );
    _students.add(student);
    DatabaseHelper().insertUser(name, id, description);
    update();
  }

  void fetchStudents() async {
    _students.clear();
    var studentsFromDb = await DatabaseHelper().getUsers();
    for (var student in studentsFromDb) {
      _students.add(StudentDataStructure(
        name: student['name'],
        id: student['id'],
        description: student['description'],

      ));
    }
    // update();
  }
}
