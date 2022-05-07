import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav_bar_animation/nav_bar_two.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _ = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Olá'),
        ),
        extendBody: true,
        bottomNavigationBar: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: _.indexSelected.value % 2 == 0
                ? Colors.white
                : Colors.blue[900],
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                currentIndex: _.indexSelected.value,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  _.indexSelected.value = index;

                  print(_.indexSelected.value % 2);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.home),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: _.indexSelected.value == 0 ? 100 : 0,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: _.indexSelected.value == 0
                                  ? BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade600,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: const Center(child: Text('Home')),
                        ),
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.explore),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: _.indexSelected.value == 1 ? 100 : 0,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: _.indexSelected.value == 1
                                  ? BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade600,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: const Center(child: Text('Explorer')),
                        ),
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.card_giftcard),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: _.indexSelected.value == 2 ? 100 : 0,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: _.indexSelected.value == 2
                                  ? BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade600,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: const Center(child: Text('Catalogo')),
                        ),
                      ],
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.settings),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: _.indexSelected.value == 3 ? 100 : 0,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: _.indexSelected.value == 3
                                  ? BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade600,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: const Center(child: Text('Settings')),
                        ),
                      ],
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              Get.to(() => const NavBarTwo());
            },
            child: const Text('LS-Dev'),
          ),
        ),
      ),
    );
  }
}
