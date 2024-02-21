import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/viewmodels/application/navbar/nav_bar_bloc.dart';
import 'package:rapid_task/views/home/home.dart';
import 'package:rapid_task/views/profile/profile.dart';

final navItems = [const HomeScreen(), const ProfileScreen()];

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.navIndex,
          onTap: (int bottomIndex) {
            BlocProvider.of<NavbarBloc>(context)
                .add(OnTapped(navIndex: bottomIndex));
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
