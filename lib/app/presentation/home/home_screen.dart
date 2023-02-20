

import 'package:flutter/material.dart';
import 'package:lift_mate/app/presentation/tab_pages/home_tab.dart';
import 'package:lift_mate/app/presentation/tab_pages/profile_tab.dart';
import 'package:lift_mate/app/presentation/tab_pages/ratings_tab.dart';
import 'package:lift_mate/core/constants.dart';
import 'package:lift_mate/core/size_config.dart';

import '../tab_pages/earning_tab.dart';

class HomeScreen extends StatefulWidget  {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

 TabController? tabController;
 int selectedIndex = 0;

 onItemClicked (int index) {
   setState(() {
     selectedIndex = index;
     tabController!.index = selectedIndex;
   });
 }

  @override
  void initState() {
    super.initState();

    tabController = TabController(
       length: 4,
       vsync: this,
     );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the driver\'s App'),
      ),
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeTabPage(),
          ProfileTabPage(),
          EarningTabPage(),
          RatingsTabPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Earnings'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Ratings'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),

        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Palette.whiteColor,
        backgroundColor: Palette.blackColor,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(fontSize: getProportionateScreenWidth(14)),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),

    );
  }
}
