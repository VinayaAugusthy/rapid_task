part of 'nav_bar_bloc.dart';


abstract class NavbarEvent {
  final int navIndex;

  const NavbarEvent({required this.navIndex});
}

class OnTapped extends NavbarEvent {
  const OnTapped({required super.navIndex});
}