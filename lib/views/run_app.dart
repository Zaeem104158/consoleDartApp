import 'package:main/controller/student_controller.dart';
import 'package:main/controller/user_controller.dart';
import 'package:main/utilits/const.dart';

void runApp() {
  UserController userController = UserController();
  StudentController studentController = StudentController();
  for (int appSection = 0; appSection <= 3; appSection++) {
    String? selectOptionNumber = inputData(
        title:
            "Enter your options: Type following numbers\n********** [1]: Add User **********\n********** [2]: Display User **********\n********** [3]: Find User **********\n********** [4]: Student Section **********\n**********[0]: Exit App**********\n");
    if (selectOptionNumber == "1") {
      print("Add your user here");
      for (int i = 0; i < 1; i++) {
        userController.email = inputData(title: "Enter your email: ");
        userController.password = inputData(title: "Enter your password: ");
        userController.thana = inputData(title: "Enter your thana: ");
        userController.address = inputData(title: "Enter your address: ");
        userController.district = inputData(title: "Enter your district: ");
        userController.division = inputData(title: "Enter your division: ");

        userController.addUser();
        if (userController.userList.isEmpty) {
          i--;
        } else {
          break;
        }
      }
      appSection--;
    } else if (selectOptionNumber == "2") {
      userController.displayUser();
      appSection--;
    } else if (selectOptionNumber == "3") {
      String? findEmail = inputData(title: "Enter finding email: ");
      userController.findUser(findEmail: findEmail);
      appSection--;
    } else if (selectOptionNumber == "4") {
      print("Add student:::::::");
      int? studentCount =
          int.parse(inputData(title: "How many students do you wanna add: ")!);

      for (int s = 0; s < studentCount; s++) {
        studentController.studentId = inputData(title: "Enter student id: ");
        studentController.studentName =
            inputData(title: "Enter student name: ");
        studentController.studentPhone =
            inputData(title: "Enter student phone number: ");
        studentController.studentEmail =
            inputData(title: "Enter student email: ");
        studentController.houseNo = inputData(title: "Enter your house no: ");
        studentController.thana = inputData(title: "Enter your thana: ");
        studentController.district = inputData(title: "Enter your district: ");
        studentController.division = inputData(title: "Enter your division: ");
        if (studentController.addUser()) {
          print("STUDENT ADDED");
        } else {
          print("STUDENT IS NOT ADDED");
        }
      }
      appSection--;
    } else if (selectOptionNumber == "0") {
      print("Terminate application");
      break;
    }
  }
}
