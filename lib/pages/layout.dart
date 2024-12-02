import 'package:flutter/material.dart';
import 'package:titkul_test/pages/home_page.dart';
import 'package:titkul_test/util/app_colors.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _pages = const [
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 3 * _selectedIndex,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: 5,
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.primary,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Thông báo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Tài khoản',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
