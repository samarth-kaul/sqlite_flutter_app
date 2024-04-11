class EmpModel {
  final int? id;
  final String name;
  final String age;
  final String contact;
  final String jobName;
  final String city;
  final String email;
  final String gender;
  final String maritalStatus;
  final String socialSecNum;

  EmpModel({
    this.id,
    required this.name,
    required this.age,
    required this.contact,
    required this.jobName,
    required this.city,
    required this.email,
    required this.gender,
    required this.maritalStatus,
    required this.socialSecNum,
  });

  // map to object conversion (de-serialization)
  EmpModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        age = res['age'],
        contact = res['contact'],
        jobName = res['jobName'],
        city = res['city'],
        email = res['email'],
        gender = res['gender'],
        maritalStatus = res['maritalStatus'],
        socialSecNum = res['socialSecNum'];

  // object to map conversion (serialization)
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      "age": age,
      "contact": contact,
      "jobName": jobName,
      'city': city,
      'email': email,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'socialSecNum': socialSecNum,
    };
  }
}
