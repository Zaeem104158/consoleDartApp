abstract class PasswordException {
  status();
}

bool caseCheck(String? value, int start, int end) {
  bool check = false;

  for (int i = 0; i < value!.length; i++) {
    if (value.codeUnitAt(i) >= start && value.codeUnitAt(i) <= end) {
      check = true;
      break;
    } else {
      check = false;
    }
  }

  return check;
}
