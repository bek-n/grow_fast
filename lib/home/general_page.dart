import 'package:flutter/material.dart';
import 'package:grow_fast/home/persons_page.dart';
import 'package:grow_fast/home/profile_page.dart';

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
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.green),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Persons'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
