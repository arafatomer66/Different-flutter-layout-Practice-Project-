import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {
  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController =
      new PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 30, 41, 1),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("1", "Welcome to Grinz",
                        "Tap Agree and Continure to accept the GRINZ Terms of Service and Privacy Policy"),
                    onBoardPage("2", "ToDo Tasks",
                        "Check how time gap between Europe & Dhaka is handled when setting a date and time "),
                    onBoardPage("3", "Events Calender",
                        "Check how time gap between Europe & Dhaka is handled when setting a date and time "),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              ),
              SizedBox(
                height: 30,
              ),
//
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color.fromRGBO(34, 46, 62, 1),
                    ),
                    child: Text(
                      "Agree and Continue",
                      style: TextStyle(fontSize: 16, color: Color.fromRGBO(155, 172, 207, 1)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 25 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Color.fromRGBO(78, 103, 134, 1) : Color.fromRGBO(34, 46, 62, 1),
    ));
  }

  Column onBoardPage(String img, String title, String des) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/image/$img.png'))),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500 ,color: Colors.white),
          ),
        ),
        InkWell(
          onTap: openLoginPage,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              des,
              style: TextStyle(fontSize: 16, color: Color.fromRGBO(155, 172, 207, 1)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  openLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
  }
}
