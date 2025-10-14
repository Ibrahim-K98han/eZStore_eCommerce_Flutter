import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../widgets/custom_image.dart';
import '../cart_screen/cart_screen.dart';
import '../category_screen/category_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';
import 'component/bottom_navigation_bar.dart';
import 'component/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainController _controller = MainController();
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: StreamBuilder<int>(
        initialData: 0,
        stream: _controller.naveListener.stream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          int item = snapshot.data ?? 0;
          return _screens[item];
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(controller: _controller),
    );
  }
}
