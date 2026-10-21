import 'package:flutter/material.dart';
import 'package:pharma_store_store_web/module/dashboard_module/screens/dashboard_screen.dart';
import 'package:pharma_store_store_web/module/home_module/widgets/side_bar_menu_widget.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreenRoute';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            // what is happening here ?
            appBar: isSmallScreen
                ? AppBar(
              title: const Text('SideBarX Example'),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
                : null,
            drawer: SideBarXExample(controller: _controller),
            body: Expanded(
              child: Row(
                children: [
                  if (!isSmallScreen) SideBarXExample(controller: _controller),
                  Expanded(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          switch (_controller.selectedIndex) {
                            case 0:
                              _key.currentState?.closeDrawer();
                              return Navigator(
                                key: const Key('dashboard_navigator'),
                                onGenerateRoute: (settings) =>
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(),
                                    ),
                              );
                            // case 1:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: UniqueKey(), // Unique key to force rebuild
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) => const ProductsScreen(),
                            //         ),
                            //   );
                            // case 2:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: UniqueKey(), // Unique key to force rebuild
                            //
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) => const PharmacyScreen(),
                            //         ),
                            //   );
                            // case 3:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: UniqueKey(), // Unique key to force rebuild
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) => const StoreScreen(),
                            //         ),
                            //   );
                            // case 4:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: UniqueKey(), // Unique key to force rebuild
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) => const OrderScreen(),
                            //         ),
                            //   );
                            // case 5:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: UniqueKey(), // Unique key to force rebuild
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) => const DashboardScreen(),
                            //         ),
                            //   );
                            // case 6:
                            //   _key.currentState?.closeDrawer();
                            //   return Navigator(
                            //     key: const Key('Settings_navigator'),
                            //     onGenerateRoute: (settings) =>
                            //         MaterialPageRoute(
                            //           builder: (context) =>
                            //           const UserProfileScreen(),
                            //         ),
                            //   );
                            // case 7:
                            //   _key.currentState?.closeDrawer();
                            //   return const Center(
                            //     child: Text(
                            //       'Theme',
                            //       style: TextStyle(
                            //           color: Colors.white, fontSize: 40),
                            //     ),
                            //   );
                            default:
                              return const Center(
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
// Method to open the profile screen
}
