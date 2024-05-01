import 'package:flutter/material.dart';

import '../../components/custom_navigation_bar.dart';
import '../../data/pref_manager.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';
import '../drawer/drawer_page.dart';
import '../messages/messages_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';
import 'home_page.dart';
import 'widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  int _selectedIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _selectPage(int index) {
    if (_pageController.hasClients) _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pages = [
      HomePage(),
      ProfilePage(),
      Container(),
      MessagesPage(),
      SettingsPage(),
    ];
    return Stack(
      children: <Widget>[
        DrawerPage(
          onTap: () {
            setState(
              () {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
              },
            );
          },
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.5 : 0),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            child: Scaffold(
              appBar: AppBar(
                leading: isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(
                            () {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            },
                          );
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = size.width - size.width / 3;
                            yOffset = size.height * 0.1;
                            scaleFactor = 0.8;
                            isDrawerOpen = true;
                          });
                        },
                      ),
                title: AppBarTitleWidget(),
                actions: <Widget>[
                  _selectedIndex == 2
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                          ),
                        )
                      : IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.notifications),
                          icon: Icon(
                            Icons.notifications_none,
                          ),
                        ),
                ],
              ),
              body: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: _pages,
              ),
              floatingActionButton: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x202e83f8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.of(context).pushNamed(Routes.bookingStep1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kColorBlue,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomNavigationBar(
                backgroundColor:
                    Prefs.isDark() ? Color(0xff121212) : Colors.white,
                strokeColor: kColorPink,
                items: [
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(0);
                    },
                    image: 'icon_home',
                    isSelected: _selectedIndex == 0,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(1);
                    },
                    image: 'icon_profile',
                    isSelected: _selectedIndex == 1,
                  ),
                  NavBarItemWidget(
                    onTap: () {},
                    image: '',
                    isSelected: false,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(3);
                    },
                    image: 'icon_messages',
                    isSelected: _selectedIndex == 3,
                  ),
                  NavBarItemWidget(
                    onTap: () {
                      _selectPage(4);
                    },
                    image: 'icon_settings',
                    isSelected: _selectedIndex == 4,
                  ),
                ],
                currentIndex: _selectedIndex,
                elevation: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
