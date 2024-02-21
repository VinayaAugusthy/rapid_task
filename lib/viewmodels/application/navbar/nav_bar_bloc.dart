
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent,NavbarState> {
  NavbarBloc() : super(const NavbarInitial(navIndex: 0)) {
    on<OnTapped>((event, emit) {
      emit(NavbarState(navIndex: event.navIndex));
    });
  }
}

