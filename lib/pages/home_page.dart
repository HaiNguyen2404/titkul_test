import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:titkul_test/data/models/parents.dart';
import 'package:titkul_test/pages/check_attendance_page.dart';
import 'package:titkul_test/util/app_colors.dart';
import 'package:titkul_test/util/app_styles.dart';
import 'package:titkul_test/widgets/circle_image.dart';
import 'package:titkul_test/widgets/home_page_tile.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Container(
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleImage(
                    image: AssetImage('images/no_profile.jpg'),
                    height: 60,
                    width: 60,
                    key: Key('Image'),
                  ),
                  const SizedBox(width: 20),
                  FutureBuilder(
                    future: loadJsonData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        throw Exception(snapshot.error);
                      } else {
                        var data = snapshot.data as Map<String, dynamic>;
                        final loginData = Parents.fromJson(data);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Xin chào phụ huynh',
                                style: AppStyles.titleSmall),
                            const SizedBox(height: 6),
                            Text(loginData.name,
                                style: AppStyles.titleSmallBold),
                            const SizedBox(height: 6),
                            Text(loginData.student.className,
                                style: AppStyles.titleSmall),
                          ],
                        );
                      }
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.people_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 20,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 80,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                  const HomePageTile(
                    icon: Icons.attach_money_rounded,
                    title: 'Biểu phí',
                    subtitle: 'thanh toán',
                  ),
                  HomePageTile(
                    icon: Icons.zoom_in_outlined,
                    title: 'Điểm danh',
                    subtitle: 'cá nhân',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CheckAttendancePage(),
                        ),
                      );
                    },
                  ),
                  const HomePageTile(
                    icon: Icons.menu_book_outlined,
                    title: 'Báo bài',
                    subtitle: 'Trong tuần',
                  ),
                  const HomePageTile(
                    icon: Icons.content_paste_search_sharp,
                    title: 'Xem đơn',
                    subtitle: 'Nghỉ phép',
                  ),
                  const HomePageTile(
                    icon: Icons.upload_file_outlined,
                    title: 'Nộp đơn',
                    subtitle: 'Nghỉ phép',
                  ),
                  const HomePageTile(
                    icon: Icons.balance_rounded,
                    title: 'Thực đơn',
                    subtitle: 'Trong tuần',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sổ liên lạc điện tử',
                              style: AppStyles.titleMedBoldBlack,
                            ),
                            Text(
                              'Phụ huynh có thể xem được kết quả học tập của học sinh',
                              style: AppStyles.titleSmallBlack,
                              maxLines: null,
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                              'Xem chi tiết',
                              style: AppStyles.titleSmallBlue,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                        ),
                        child: const Icon(
                          Icons.auto_graph_outlined,
                          color: AppColors.primary,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> loadJsonData() async {
    String jsonString = await rootBundle.loadString(
      'lib/data/json/DangNhap.json',
    );
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}
