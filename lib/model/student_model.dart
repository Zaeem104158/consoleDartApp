class StudentModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  Address? address;

  StudentModel({this.id, this.name, this.phone, this.email, this.address});
}

class Address {
  String? studentId;
  String? houseNo;
  String? thana;
  String? district;
  String? division;

  Address(
      {this.studentId, this.houseNo, this.thana, this.district, this.division});
}
