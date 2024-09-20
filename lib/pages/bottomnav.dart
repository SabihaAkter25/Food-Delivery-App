import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app_with_admin_panel/pages/profile.dart';
import 'package:delivery_app_with_admin_panel/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'order.dart';

class BottomNav extends StatefulWidget {
  final String name; // Declare name property

  const BottomNav({Key? key, required this.name}) : super(key: key); // Correct the constructor

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homepage = Home(name: widget.name); // Use widget.name
    order = const Order();
    profile = const Profile();
    wallet = const Wallet();
    pages = [homepage, order, wallet, profile];
    currentPage = homepage; // Set the initial page to homepage
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 700),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
