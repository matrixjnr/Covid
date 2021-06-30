import 'package:covid_tracker/guides/guides.dart';
import 'package:covid_tracker/news/features/covid_19/presentation/pages/coivd_page.dart';
import 'package:covid_tracker/news/features/covid_19/presentation/widgets/app_bar_design.dart';
import 'package:covid_tracker/pages/screens/home_screen.dart';
import 'package:covid_tracker/theme/color/light_color.dart';
import 'package:covid_tracker/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        CovidPage(),
        MyHomePage(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30),
          //   child: Column(
          //     children: <Widget>[
          //       const YMargin(60),
          //       Text(
          //         'Covid-19',
          //         style: GoogleFonts.cabin(
          //           textStyle:
          //               TextStyle(fontSize: 21, color: Color(0xff989CAC)),
          //         ),
          //       ),
          //       const YMargin(4),
          //       Text(
          //         'Tracker',
          //         style: GoogleFonts.cabin(
          //           textStyle: TextStyle(
          //               fontSize: 27,
          //               color: Colors.black,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const YMargin(10),
          Expanded(child: buildPageView()),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10)
                .add(EdgeInsets.only(top: 5)),
            child: GNav(
                gap: 10,
                activeColor: Colors.white,
                color: Colors.grey[400],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.globe,
                    text: 'World',
                    backgroundColor: CardColors.red,
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'Local',
                    backgroundColor: Color(0xff001399),
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Guides',
                    backgroundColor: Colors.orange,
                  ),
                  // GButton(
                  //   icon: LineIcons.cog,
                  //   text: 'Settings',
                  //   backgroundColor: CardColors.green,
                  // ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    pageController.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
