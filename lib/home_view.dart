import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    const Tab(text: 'LEFT'),
    const Tab(text: 'RIGHT'),
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add))
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
        body: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              color: Colors.red,
              height: 250,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(29))),
                          child: Column(
                            children: const [
                              Text(
                                'This is the tab',
                                style: TextStyle(fontSize: 36),
                              ),
                              Text(
                                'This is the  tab',
                                style: TextStyle(fontSize: 116),
                              ),
                              Text(
                                'This is the  tab',
                                style: TextStyle(fontSize: 116),
                              ),
                              Text(
                                'This is the  tab',
                                style: TextStyle(fontSize: 116),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text('data')
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
