import 'package:main/errors/password_errors.dart';
import 'package:main/model/user_model.dart';
import 'package:main/utilits/const.dart';

class UserController implements Creation, PasswordException {
  String? email;
  String? password;
  String? address;
  String? thana;
  String? district;
  String? division;
  List<UserModel> userList = [];
  UserModel? userModel;

  @override
  bool status(
      {bool isUpperCase = false,
      bool isLowerCase = false,
      bool isSpecialCase = false}) {
    if (isUpperCase && isLowerCase && isSpecialCase) {
      print("**********Valid Password**********");
      return true;
    } else if (isUpperCase && isLowerCase && !isSpecialCase) {
      print("Need one special Case");
      return false;
    } else if (isUpperCase && !isLowerCase && isSpecialCase) {
      print("Need one lowe case");
      return false;
    } else if (!isUpperCase && isLowerCase && isSpecialCase) {
      print("Need one uppser case");
      return false;
    } else if (!isUpperCase && !isLowerCase && isSpecialCase) {
      print("Need one upper and lower case");
      return false;
    } else if (isUpperCase && !isLowerCase && !isSpecialCase) {
      print("Need one lower and special case");
      return false;
    } else if (!isUpperCase && isLowerCase && !isSpecialCase) {
      print("Need one upper and special case");
      return false;
    }
    return false;
  }

  @override
  List<UserModel> addUser({String? email}) {
    bool authenticatedUser = authenticate(
      email: email,
      password: password,
    );
    // ! if authenticate then user will added.
    if (authenticatedUser) {
      bool hasUser = false;
      userList.forEach((element) {
        if (element.userEmail == email) {
          hasUser = true;
        } else {
          hasUser = false;
        }
      });
      !hasUser
          ? userList.addAll([
              UserModel(
                  userEmail: email,
                  userPassword: password,
                  userAddress: address,
                  userThana: thana,
                  userDistrict: district,
                  userDivision: division)
            ])
          : print("Already added user");
    } else {
      userList = [];
    }
    print(userList.length);
    return userList;
  }

  @override
  bool authenticate({String? email, String? password}) {
    bool isSpecialCharacter;
    bool isUpperCase;
    bool isLowerCase;
    bool authenticatedPassword;
    bool authenticatedEmail;

    if (email!.isEmpty) {
      authenticatedEmail = false;
    }

    // Check if the email contains a single @ symbol
    int atSymbolIndex = email.indexOf("@");
    if (atSymbolIndex == -1 || atSymbolIndex != email.lastIndexOf("@")) {
      atSymbolIndex = -1;
      authenticatedEmail = false;
    } else {
      authenticatedEmail = true;
    }
    if (atSymbolIndex == -1) {
      print("/InValid Email Input/");
    } else {
      // Check if the email contains a period (.) after the @ symbol
      int dotIndex = email.indexOf(".", atSymbolIndex);
      if (dotIndex == -1 || dotIndex == email.length - 1) {
        authenticatedEmail = false;
      } else {
        print("**********Valid Email Input**********");
        authenticatedEmail = true;
      }
    }
    //email
    // authenticatedEmail = emailValidation(email);

    //Password
    isSpecialCharacter = caseCheck(password, 33, 64);
    isUpperCase = caseCheck(password, 65, 90);
    isLowerCase = caseCheck(password, 97, 122);
    if (password!.length >= 5) {
      authenticatedPassword = status(
          isLowerCase: isLowerCase,
          isUpperCase: isUpperCase,
          isSpecialCase: isSpecialCharacter);
    } else {
      print("Password at least 6 letters");
      authenticatedPassword = false;
    }

    if (authenticatedEmail && authenticatedPassword) {
      return true;
    }
    return false;
  }

  @override
  findUser({String? findEmail}) {
    //Problem Here
    int findedIndexInList = 0;
    bool found = false;

    for (int i = 0; i < userList.length; i++) {
      found = userList[i].userEmail!.contains(findEmail!.trim());
      findedIndexInList = i;
      if (found) {
        break;
      }
    }
    if (found) {
      print("------User has found------");
      print(
          "User Email: ${userList[findedIndexInList].userEmail}\nUser Password: ${userList[findedIndexInList].userPassword}\nUser Address: ${userList[findedIndexInList].userAddress}\nUser Thana: ${userList[findedIndexInList].userThana}\nUser District: ${userList[findedIndexInList].userDistrict}\nUser Division: ${userList[findedIndexInList].userDivision}");
    } else {
      print("------User not found------");
    }
  }

  @override
  displayUser() {
    List<UserModel> userData = userList;
    if (userList.isNotEmpty) {
      for (var element in userData) {
        //title != null ? print(title) :
        print("------Display user data: ------");
        print(
            "User Email: ${element.userEmail}\nUser Password: ${element.userPassword}\nUser Address: ${element.userAddress}\nUser Thana: ${element.userThana}\nUser District: ${element.userDistrict}\nUser Division: ${element.userDivision}");
      }
    } else {
      print("------Please add user first to display user.------");
    }
  }
}
