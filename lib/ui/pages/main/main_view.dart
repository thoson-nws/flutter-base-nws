import 'package:flutter/material.dart';
import 'package:flutter_base/ui/pages/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tab_home/home_tab_view.dart';
import '../tab_profile/profile_tab_view.dart';
import 'main_state.dart';
import 'tab/main_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ///PageView page
  late List<Widget> pageList;
  late PageController pageController;

  final tabs = [
    MainTab.home,
    MainTab.discover,
    MainTab.tvShows,
    MainTab.watchlist,
    MainTab.profile,
  ];

  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = MainCubit();
    super.initState();
    //PageView page
    pageList = [
      const HomeTabPage(),
      Container(color: Colors.green),
      Container(color: Colors.red),
      Container(color: Colors.green),
      const ProfileTabPage(),
    ];
    //Page controller
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
      children: pageList,
      onPageChanged: (index) {
        _cubit.switchTap(index);
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    final theme = Theme.of(context);
    return BlocConsumer<MainCubit, MainState>(
      bloc: _cubit,
      listenWhen: (prev, current) {
        return prev.selectedIndex != current.selectedIndex;
      },
      listener: (context, state) {
        pageController.jumpToPage(state.selectedIndex);
      },
      buildWhen: (prev, current) {
        return prev.selectedIndex != current.selectedIndex;
      },
      builder: (context, state) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: theme.appBarTheme.backgroundColor,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: theme.indicatorColor,
          items: tabs.map((e) => e.tab).toList(),
          onTap: (index) {
            _cubit.switchTap(index);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
