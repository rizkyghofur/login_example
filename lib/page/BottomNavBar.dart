import 'package:flutter/material.dart';
import 'package:login_example/page/BiodataPage.dart';
import 'package:login_example/page/DataPage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedNavbar = 0;
  List<Widget> menu = [DataScreenPage(), BiodataPage()];
  PageController _pageController;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
      _pageController.jumpToPage(_selectedNavbar);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedNavbar);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: AlwaysScrollableScrollPhysics(),
        children: menu,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Data'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
