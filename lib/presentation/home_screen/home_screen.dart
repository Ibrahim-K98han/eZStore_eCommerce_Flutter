import 'package:ezstore/presentation/home_screen/component/home_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScrollView(slivers: [HomeAppBar()]));
  }
}
