import 'package:flutter/material.dart';
import 'package:titkul_test/data/models/check_attendance.dart';
import 'package:titkul_test/util/app_styles.dart';

class AttendanceTile extends StatelessWidget {
  final String session;
  final CheckAttendance checkAttendance;

  const AttendanceTile({
    super.key,
    required this.session,
    required this.checkAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session,
                style: AppStyles.titleMedBoldBlack,
              ),
              Row(
                children: [
                  Text(
                    'Điểm danh lần đầu: ',
                    style: AppStyles.titleSmallBlack,
                  ),
                  Text(
                    session == 'Buổi sáng'
                        ? checkAttendance.firstMorningCheck
                        : checkAttendance.firstNoonCheck,
                    style: AppStyles.titleSmallBlack,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Điểm danh lần cuối: ',
                    style: AppStyles.titleSmallBlack,
                  ),
                  Text(
                    session == 'Buổi sáng'
                        ? checkAttendance.lastMorningCheck
                        : checkAttendance.lastNoonCheck,
                    style: AppStyles.titleSmallBlack,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            session == 'Buổi sáng'
                ? checkAttendance.morningStatus
                : checkAttendance.noonStatus,
            style: AppStyles.titleSmallGreen,
          ),
        ],
      ),
    );
  }
}
