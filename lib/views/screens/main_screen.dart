import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moschos_class/views/screens/nav_screens/account_screen.dart';
import 'package:moschos_class/views/screens/nav_screens/category_screen.dart';
import 'package:moschos_class/views/screens/nav_screens/favorite_screen.dart';
import 'package:moschos_class/views/screens/nav_screens/home_screen.dart';
import 'package:moschos_class/views/screens/nav_screens/search_screen.dart';
import 'package:moschos_class/views/screens/nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    StoreScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    CustomerAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.cyan,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
        ),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shop.svg',
            ),
            label: 'STORE',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explore.svg',
            ),
            label: 'CATEGORIES',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorite.svg',
            ),
            label: 'FAVORITE',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
            ),
            label: 'ACCOUNT',
          ),
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
