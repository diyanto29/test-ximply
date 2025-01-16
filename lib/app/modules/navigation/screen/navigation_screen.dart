import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/constants/shared_pref_consts.dart';
import 'package:fonta_app/app/config/pods/injector_config.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/modules/cart/screen/cart_screen.dart';
import 'package:fonta_app/app/modules/home/screen/home_screen.dart';
import 'package:fonta_app/app/modules/navigation/pods/navigation_pod.dart';
import 'package:fonta_app/app/modules/profile/screen/profile_screen.dart';
import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationScreen extends StatefulHookConsumerWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  static const List<Widget> widgetOptions = [
    HomeScreen(),
    CartScreen(),
    Scaffold(),
    ProfileScreen(),
  ];

  BottomNavigationBarItem _bottomNavigationBarItem(
    IconData iconData,
    String label,
    int index,
    int selectedIndex,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: selectedIndex == index ? Colors.greenAccent : Colors.black,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    var navigationPod = ref.watch(navigationPodProvider);
    var navigationNotifier = ref.read(navigationPodProvider.notifier);
    return Scaffold(
      body: widgetOptions.elementAt(navigationPod),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _bottomNavigationBarItem(Icons.home_filled, 'Home', 0, navigationPod),
          _bottomNavigationBarItem(
              Icons.shopping_bag_outlined, 'Keranjang', 1, navigationPod),
          _bottomNavigationBarItem(Icons.history, 'History', 2, navigationPod),
          _bottomNavigationBarItem(
              Icons.account_circle_outlined, 'Profile', 3, navigationPod),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationPod,
        onTap: (value) async {
          var sharedPrefs = sl<SharedPrefs>();
          if (value != 0) {
            if (sharedPrefs.get(SharedPrefConst.token) != null) {
              navigationNotifier.setSelectedIndex(context, value);
            } else {
              GoRouter.of(context).pushNamed(RouteNames.login);
            }
          } else {
            navigationNotifier.setSelectedIndex(context, value);
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
      ),
    );
  }
}
