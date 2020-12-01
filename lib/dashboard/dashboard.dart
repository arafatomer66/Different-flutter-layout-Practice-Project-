import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/service.dart';
import '../services/service_locator.dart';
import 'cards.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 10;
  int currentIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(22, 30, 41, 1),
          title: Text(
            'Overview',
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: new Image.asset("assets/icon/search.png"),
            ),
            IconButton(
              onPressed: () {},
              icon: new Image.asset("assets/icon/options.png"),
            ),
          ]),
      backgroundColor: Color.fromRGBO(22, 30, 41, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) => {setCurrentPage(value)},
              children: [
                Cards(),
                Cards(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(22, 30, 41, 1),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  icon:
                                      new Image.asset("assets/icon/calendar.png"),
                                ),
                              ],
                            ),
                          ),
                          // currentIndex == 1 ? new Image.asset("assets/icon/group_h.png") :
                          InkWell(
                            onTap: () {
                              setCurrentPage(0);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  currentIndex == 0
                                      ? IconButton(
                                          icon: new Image.asset(
                                              "assets/icon/single_h.png"),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            print(currentIndex);
                                          },
                                          icon: new Image.asset(
                                              "assets/icon/person.png"),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                          ),
                          InkWell(
                            onTap: () {
                              setCurrentPage(1);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  currentIndex == 1
                                      ? IconButton(
                                          onPressed: () {
                                            print(currentIndex);
                                          },
                                          icon: new Image.asset(
                                              "assets/icon/group_h.png"),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            print(currentIndex);
                                          },
                                          icon: new Image.asset(
                                              "assets/icon/group.png"),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: new Image.asset("assets/icon/right.png"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 180),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(253, 211, 42, 1),
                                Color.fromRGBO(253, 211, 42, 1)
                              ],
                            ),
//                            shape: BoxShape.circle,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 40, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  setCurrentPage(int value) {
    currentIndex = value;
    print(currentIndex);
    setState(() {});
  }
}
