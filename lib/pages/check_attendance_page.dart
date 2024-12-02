import 'package:flutter/material.dart';
import 'package:titkul_test/pages/attendance_info.dart';
import 'package:titkul_test/util/app_colors.dart';
import 'package:titkul_test/util/app_styles.dart';
import 'package:titkul_test/widgets/tab_bar_item.dart';

class CheckAttendancePage extends StatefulWidget {
  const CheckAttendancePage({super.key});

  @override
  State<CheckAttendancePage> createState() => _CheckAttendancePageState();
}

class _CheckAttendancePageState extends State<CheckAttendancePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 6;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 7,
      vsync: this,
      initialIndex: 6,
    );
    _pages = [
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      const AttendanceInfo(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            color: AppColors.primary,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Điểm danh ',
                  style: AppStyles.titleSmall,
                ),
                const Text(
                  '16/11/2024',
                  style: AppStyles.titleSmall,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: AppColors.primary,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text('tháng 11 năm 2024'),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: AppColors.primary,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    tabAlignment: TabAlignment.fill,
                    controller: tabController,
                    dividerColor: Colors.transparent,
                    isScrollable: false,
                    onTap: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    tabs: [
                      TabBarItem(
                        day: 'CN',
                        date: '10',
                        isSelected: _selectedIndex == 0,
                      ),
                      TabBarItem(
                        day: 'Th2',
                        date: '11',
                        isSelected: _selectedIndex == 1,
                      ),
                      TabBarItem(
                        day: 'Th3',
                        date: '12',
                        isSelected: _selectedIndex == 2,
                      ),
                      TabBarItem(
                        day: 'Th4',
                        date: '13',
                        isSelected: _selectedIndex == 3,
                      ),
                      TabBarItem(
                        day: 'Th5',
                        date: '14',
                        isSelected: _selectedIndex == 4,
                      ),
                      TabBarItem(
                        day: 'Th6',
                        date: '15',
                        isSelected: _selectedIndex == 5,
                      ),
                      TabBarItem(
                        day: 'Th7',
                        date: '16',
                        isSelected: _selectedIndex == 6,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
