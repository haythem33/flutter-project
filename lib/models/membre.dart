class Member {
  String? firstName;
  String? lastName;
  int? phoneNumber;

  Member(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber});
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber
    };
  }

  static Member fromMap(Map<String, dynamic> json) {
    return Member(
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber']);
  }
}
