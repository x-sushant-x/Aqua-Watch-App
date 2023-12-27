import 'package:aqua_watch_app/screens/ngo_dashboard_page.dart';
import 'package:aqua_watch_app/view/onboarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:aqua_watch_app/screens/emergency.dart';
import 'package:aqua_watch_app/screens/home_page.dart';
import 'package:aqua_watch_app/screens/map.dart';
import 'package:aqua_watch_app/screens/profile.dart';
import 'package:aqua_watch_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  // Initially treat as a user
  bool isNGO = false;

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
    // If it is NGO, then use NGODashboardPage() at first position instead of HomePage()
    HomePage(),
    MapPage(),
    Emergency(),
    Profile(),
  ];
  checkNGO();
  }

  Future<void> checkNGO() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString("description") != null) {
    setState(() {
      isNGO = true;
      _widgetOptions[0] = NGODashboardPage();
      _selectedIndex = 0;
    });
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // If it is NGO then _selectedIndex != 0 && _selectedIndex != 1 is the correct condition
    // as NGODashboard page doesnt have an appBar in design
    bool toShowAppBar = (isNGO && _selectedIndex != 0 && _selectedIndex != 1) || (isNGO == false && _selectedIndex != 1);
    if (toShowAppBar) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenSize.height / 13,
          backgroundColor: AppColors.white2,
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors.black),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add your menu icon onPressed action here
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                print("Prefs Cleared");
                Get.offAll(SplashPage());
              },
            ),
          ],
          titleSpacing: 45.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 3, left: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/app icon.png',
                  height: screenSize.width * 0.11,
                  width: screenSize.width * 0.11,
                ),
                SizedBox(width: 1.0),
                Text(
                  'Aqua Watch',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: screenSize.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  _onItemTapped(0);
                },
                child: Icon(
                  Icons.home_rounded,
                  color: _selectedIndex == 0 ? AppColors.black : AppColors.grey,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  _onItemTapped(1);
                },
                child: Icon(
                  Icons.map,
                  color: _selectedIndex == 1 ? AppColors.black : AppColors.grey,
                ),
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  _onItemTapped(2);
                },
                child: Icon(
                  Icons.emergency,
                  color: _selectedIndex == 2 ? AppColors.black : AppColors.grey,
                ),
              ),
              label: 'Emergency',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  _onItemTapped(3);
                },
                child: Icon(
                  Icons.person,
                  color: _selectedIndex == 3 ? AppColors.black : AppColors.grey,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey,
          onTap: _onItemTapped,
        ),
      );
    } else {
      return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: Icon(
                    Icons.home_rounded,
                    color:
                        _selectedIndex == 0 ? AppColors.black : AppColors.grey,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: Icon(
                    Icons.map,
                    color:
                        _selectedIndex == 1 ? AppColors.black : AppColors.grey,
                  ),
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: Icon(
                    Icons.emergency,
                    color:
                        _selectedIndex == 2 ? AppColors.black : AppColors.grey,
                  ),
                ),
                label: 'Emergency',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    _onItemTapped(3);
                  },
                  child: Icon(
                    Icons.person,
                    color:
                        _selectedIndex == 3 ? AppColors.black : AppColors.grey,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.black,
            unselectedItemColor: AppColors.grey,
            onTap: _onItemTapped,
          ));
    }
  }
}
