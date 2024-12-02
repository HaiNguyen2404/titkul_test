import 'package:titkul_test/data/models/student.dart';

class CheckAttendance {
  final Student student;
  final String firstMorningCheck;
  final String lastMorningCheck;
  final String firstNoonCheck;
  final String lastNoonCheck;
  final String morningStatus;
  final String noonStatus;

  CheckAttendance({
    required this.student,
    required this.firstMorningCheck,
    required this.lastMorningCheck,
    required this.firstNoonCheck,
    required this.lastNoonCheck,
    required this.morningStatus,
    required this.noonStatus,
  });

  factory CheckAttendance.fromJson(Map<String, dynamic> json) {
    final studentData = Student(
      name: json['stringdata']['ten_hocsinh'],
      className: json['stringdata']['ten_lop'],
    );

    return CheckAttendance(
      student: studentData,
      firstMorningCheck: json['stringdata']['thoigiandiemdanh']
              ['landaubuoisang'] ??
          'Chưa điểm danh',
      lastMorningCheck: json['stringdata']['thoigiandiemdanh']
              ['lancuoibuoisang'] ??
          'Chưa điểm danh',
      firstNoonCheck: json['stringdata']['thoigiandiemdanh']
              ['landaubuoichieu'] ??
          'Chưa điểm danh',
      lastNoonCheck: json['stringdata']['thoigiandiemdanh']
              ['lancuoibuoichieu'] ??
          'Chưa điểm danh',
      morningStatus: json['stringdata']['trangthaisang'] == 1 ? 'Có mặt' : '',
      noonStatus: json['stringdata']['trangthaichieu'] == 1 ? 'Có mặt' : '',
    );
  }
}
