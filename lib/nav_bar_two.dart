import 'package:flutter/material.dart';

class NavBarTwo extends StatefulWidget {
  const NavBarTwo({Key? key}) : super(key: key);

  @override
  State<NavBarTwo> createState() => _NavBarTwoState();
}

class _NavBarTwoState extends State<NavBarTwo> {
  ValueNotifier<int> indexSelectedNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NavBarTwo'),
        ),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: indexSelectedNotifier,
            builder: (context, int indexSelected, child) {
              return AnimatedContainer(
                width: MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 500),
                color: indexSelected % 2 == 0 ? Colors.white : Colors.blue[900],
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: Stack(
                    children: [
                      BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        currentIndex: indexSelected,
                        selectedItemColor: Colors.white,
                        onTap: (index) {
                          indexSelectedNotifier.value = index;

                          print(indexSelectedNotifier.value % 2);
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
                        left: indexSelected *
                                (MediaQuery.of(context).size.width * .225) +
                            17,
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
                                color: indexSelected % 2 == 0
                                    ? Colors.blue[900]!
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
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
