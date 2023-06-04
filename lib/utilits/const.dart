import 'dart:io';

abstract class Creation {
  findUser();
  authenticate();
  addUser();
  displayUser();
}

String? inputData({String? title}) {
  stdout.write(title);
  String? output = stdin.readLineSync();
  return output;
}

// bool emailValidation(String? email) {
//   bool authenticatedEmail;

//   if (email!.isEmpty) {
//     authenticatedEmail = false;
//   }

//   // Check if the email contains a single @ symbol
//   int atSymbolIndex = email.indexOf("@");
//   if (atSymbolIndex == -1 || atSymbolIndex != email.lastIndexOf("@")) {
//     atSymbolIndex = -1;
//     authenticatedEmail = false;
//   } else {
//     // authenticatedEmail = true;
//   }
//   if (atSymbolIndex == -1) {
//     int dotIndex = email.indexOf(".", atSymbolIndex);
//     if (dotIndex == -1 || dotIndex == email.length - 1) {
//       authenticatedEmail = false;
//     } else {
//       print("**********Valid Email Input**********");
//       authenticatedEmail = true;
//     }
//   } else {
//     print("**********Invalid Email Input**********");
//     authenticatedEmail = false;
//   }
//   return authenticatedEmail;
// }
