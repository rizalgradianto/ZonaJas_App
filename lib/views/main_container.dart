import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/favorite.dart';
import 'package:zonajas/views/home.dart';
import 'package:zonajas/views/order.dart';
import 'package:zonajas/views/profile.dart';

class MainContainerView extends StatefulWidget {
  _MainContainerView createState() => _MainContainerView();
}

class _MainContainerView extends State<MainContainerView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    OrderView(),
    FavoriteView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: neutralWhite,
          primaryColor: primaryBlue,
          textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: TextStyle(color: textSubdued),
                displaySmall: TextStyle(color: textSubdued),
              ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: primaryBlue,
          unselectedItemColor: textSubdued,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset(
                      'assets/images/beranda/icBerandaOn.png',
                      width: 24,
                      height: 24,
                    )
                  : Image.asset('assets/images/beranda/icBerandaOff.png',
                      width: 24, height: 24),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset(
                      'assets/images/beranda/icPesananOn.png',
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      'assets/images/beranda/icPesananOff.png',
                      width: 24,
                      height: 24,
                    ),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Image.asset(
                      'assets/images/beranda/icFavoritOn.png',
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      'assets/images/beranda/icFavoritOff.png',
                      width: 24,
                      height: 24,
                    ),
              label: 'Favorit',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Image.asset(
                      'assets/images/beranda/icProfilOn.png',
                      width: 24,
                      height: 24,
                    )
                  : Image.asset(
                      'assets/images/beranda/icProfilOff.png',
                      width: 24,
                      height: 24,
                    ),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
