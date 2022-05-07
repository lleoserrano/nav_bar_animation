import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class NavBarTwo extends StatefulWidget {
  const NavBarTwo({Key? key}) : super(key: key);

  @override
  State<NavBarTwo> createState() => _NavBarTwoState();
}

class _NavBarTwoState extends State<NavBarTwo> {
  @override
  Widget build(BuildContext context) {
    final _ = Get.find<HomeController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NavBarTwo'),
        ),
        bottomNavigationBar: Obx(
          () => AnimatedContainer(
            width: Get.width,
            duration: const Duration(milliseconds: 500),
            color: _.indexSelected.value % 2 == 0
                ? Colors.white
                : Colors.blue[900],
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: Stack(
                children: [
                  BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    currentIndex: _.indexSelected.value,
                    selectedItemColor: Colors.white,
                    onTap: (index) {
                      _.indexSelected.value = index;
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.explore),
                        label: 'Explorer',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.card_giftcard),
                        label: 'Catalogo',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
                  AnimatedPositioned(
                    width: 100,
                    left: _.indexSelected.value * (Get.width * .225) + 17,
                    bottom: 0,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 100,
                      constraints: const BoxConstraints(
                        maxWidth: 100,
                      ),
                      height: 5,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: _.indexSelected.value % 2 == 0
                                ? Colors.lightBlue.shade600
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {},
            child: const Text('LS-Dev'),
          ),
        ),
      ),
    );
  }
}
