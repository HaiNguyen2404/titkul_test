import 'package:titkul_test/data/models/student.dart';

class Parents {
  final String name;
  final Student student;

  Parents({
    required this.name,
    required this.student,
  });

  factory Parents.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> studentJson =
        json['stringdata']['phu_huynh']['hocsinh'][0];

    return Parents(
      name: json['stringdata']['phu_huynh']['hoten'],
      student: Student.fromJson(studentJson),
    );
  }
}
