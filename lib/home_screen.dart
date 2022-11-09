import 'package:flutter/material.dart';

import 'contact_tab.dart';
import 'news_feed.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onTapIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> lsScreen = [
    Text('Màn hình 1'),
    ContactTab(),
    NewsFeed(),
    Text('Màn hình 4'),
    Text('Màn hình 5'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm Kiếm',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onTapIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Tin nhắn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Danh bạ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Nhật ký',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Cá nhân',
          ),
        ],
      ),
      body: lsScreen[_selectedIndex],
    );
  }
}
