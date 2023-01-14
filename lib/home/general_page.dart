import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:grow_fast/home/persons_page.dart';
import 'package:grow_fast/home/profile_page.dart';
import 'package:grow_fast/style/style.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'card_page.dart';
import 'product_page.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int selectedIndex = 0;
  List<Widget> Pages = [
    ProductPage(),
    CartPage(),
    PersonsPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Pages[selectedIndex],
        bottomNavigationBar: Scaffold(
            body: Pages[selectedIndex],
            bottomNavigationBar: WaterDropNavBar(
              waterDropColor: Style.colorOfPrice,
              inactiveIconColor: Colors.grey,
              backgroundColor: Color(0xffF1F4F3),
              onItemSelected: (value) {
                selectedIndex = value;
                setState(() {});
              },
              selectedIndex: selectedIndex,
              barItems: [
                BarItem(
                    filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
                BarItem(
                    filledIcon: Icons.shopping_cart_checkout_outlined,
                    outlinedIcon: Icons.shopping_cart_checkout),
                BarItem(
                    filledIcon: Icons.group,
                    outlinedIcon: Icons.group_outlined),
                BarItem(
                    filledIcon: Icons.person,
                    outlinedIcon: Icons.person_outline),
              ],
            )));
  }
}
