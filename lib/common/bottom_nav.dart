import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pets/Service/useridStore.dart';
import 'package:pets/intro_screens/intro_screen1.dart';
import 'package:pets/sign_up/scheduling_time.dart';
import 'package:pets/intro_screens/page_controller_screen.dart';
import 'package:pets/add_scheduling_type/select_scheduling_type.dart';
import 'package:pets/invite/invite_screen.dart';

class BottomNavigation extends StatefulWidget {
  final userdata;
  BottomNavigation({this.userdata});
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  var userData;
  @override
  void initState() {
    super.initState();
    setState(() {
      userData = widget.userdata;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    InviteScreen(),
    ScheduledTimeScreen(),
    SelectSchedulingType(
        // userdata: userData,
        ),
    Text("Family"),
    Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffebebeb),
          body: Center(
            child: _children.elementAt(_currentIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
              unselectedFontSize: 10,
              selectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(MdiIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.list_alt_rounded,
                  ),
                  label: "Schedule",
                ),
                BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.favorite_border,
                  ),
                  label: "Family",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_outlined,
                  ),
                  label: "Profile",
                ),
              ]),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    print(widget.userdata);
    setState(() {
      _currentIndex = index;
    });
  }
}
