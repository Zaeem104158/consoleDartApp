import 'package:main/model/student_model.dart';
import 'package:main/utilits/const.dart';

class StudentController implements Creation {
  String? studentId;
  String? studentName;
  String? studentPhone;
  String? studentEmail;
  String? houseNo;
  String? district;
  String? division;
  String? thana;
  List<StudentModel> studentList = [];
  @override
  findUser() {}
  @override
  authenticate() {}
  @override
  bool addUser() {
    if (district != null &&
        division != null &&
        studentId != null &&
        studentName != null &&
        studentEmail != null &&
        studentPhone != null &&
        houseNo != null &&
        thana != null &&
        district != "" &&
        division != "" &&
        studentId != "" &&
        studentName != "" &&
        studentEmail != "" &&
        studentPhone != "" &&
        houseNo != "" &&
        thana != "") {
      studentList.add(StudentModel(
          id: studentId,
          email: studentEmail,
          name: studentName,
          phone: studentPhone,
          address: Address(
            studentId: studentId,
            houseNo: houseNo,
            thana: thana,
            district: district,
            division: division,
          )));
      return true;
    } else {
      return false;
    }
  }

  @override
  displayUser() {}
}
