import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:grow_fast/home/persons_page.dart';
import 'package:grow_fast/home/profile_page.dart';
import 'package:grow_fast/style/style.dart';

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
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Style.white,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              color: Style.greyColor,
              activeColor: Color(0xff32CB4B),
              items: [
                TabItem(icon: Icon(Icons.home), title: 'Home'),
                TabItem(
                    icon: Icon(Icons.shopping_cart_checkout_outlined),
                    title: 'Cart'),
                TabItem(icon: Icon(Icons.group), title: 'Persons'),
                TabItem(icon: Icon(Icons.person), title: 'Profile'),
              ],
            )));
  }
}
