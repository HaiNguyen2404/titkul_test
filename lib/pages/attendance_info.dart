import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:titkul_test/data/models/check_attendance.dart';
import 'package:titkul_test/util/app_styles.dart';
import 'package:titkul_test/widgets/attendance_tile.dart';
import 'package:titkul_test/widgets/circle_image.dart';
import 'package:flutter/services.dart' show rootBundle;

class AttendanceInfo extends StatelessWidget {
  const AttendanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          throw Exception(snapshot.error);
        } else {
          var attendanceData = snapshot.data as Map<String, dynamic>;
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.white,
                child: Row(
                  children: [
                    CircleImage(
                      image: AssetImage('images/no_profile.jpg'),
                      height: 60,
                      width: 60,
                      key: Key('check_attendance'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CheckAttendance.fromJson(attendanceData).student.name,
                          style: AppStyles.titleSmallBlue,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Sáng: ',
                              style: AppStyles.titleSmallBlack,
                            ),
                            Text(
                              CheckAttendance.fromJson(attendanceData)
                                  .morningStatus,
                              style: AppStyles.titleSmallGreen,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Chiều: ',
                              style: AppStyles.titleSmallBlack,
                            ),
                            Text(
                              CheckAttendance.fromJson(attendanceData)
                                  .noonStatus,
                              style: AppStyles.titleSmallGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AttendanceTile(
                session: 'Buổi sáng',
                checkAttendance: CheckAttendance.fromJson(attendanceData),
              ),
              AttendanceTile(
                session: 'Buổi chiều',
                checkAttendance: CheckAttendance.fromJson(attendanceData),
              ),
            ],
          );
        }
      },
    );
  }

  Future<Map<String, dynamic>> loadJsonData() async {
    String jsonString = await rootBundle.loadString(
      'lib/data/json/GetDiemDanhById.json',
    );
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}
