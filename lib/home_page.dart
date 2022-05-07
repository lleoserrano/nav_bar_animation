import 'package:flutter/material.dart';
import 'package:nav_bar_animation/nav_bar_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> indexSelectedNotifier = ValueNotifier(0);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Olá'),
        ),
        extendBody: true,
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: indexSelectedNotifier,
            builder: (context, int indexSelected, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: indexSelected % 2 == 0 ? Colors.white : Colors.blue[900],
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    currentIndex: indexSelected,
                    selectedItemColor: Colors.white,
                    onTap: (index) {
                      indexSelectedNotifier.value = index;

                      print(indexSelectedNotifier.value % 2);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.home),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: indexSelected == 0 ? 100 : 0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: indexSelected == 0
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
                              width: indexSelected == 1 ? 100 : 0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: indexSelected == 1
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
                              width: indexSelected == 2 ? 100 : 0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: indexSelected == 2
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
                              width: indexSelected == 3 ? 100 : 0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: indexSelected == 3
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
              );
            }),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavBarTwo()));
            },
            child: const Text('LS-Dev'),
          ),
        ),
      ),
    );
  }
}
