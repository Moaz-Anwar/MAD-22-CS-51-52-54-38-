import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/view/cart_view.dart';
import 'package:medicine_delivery/view/favourites_view.dart';
import 'package:medicine_delivery/view/home_screen.dart';
import 'package:medicine_delivery/view/profile_view.dart';
import 'package:medicine_delivery/view/search_view.dart';

import '../controllers/bottom_nav_controller.dart';



class BottomNavBar extends StatelessWidget {
  final BottomNavController _controller = Get.put(BottomNavController());

  final List<Widget> _pages = [
    HomeScreen(),
    SearchView(),
    CartView(),
    FavouritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Obx(() => _pages[_controller.currentIndex.value]), // Observe current index
        bottomNavigationBar: Obx(
              () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.cyan,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            iconSize: 25,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            currentIndex: _controller.currentIndex.value,
            onTap: (index) {
              _controller.changePage(index); // Update the selected index
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favourite'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
