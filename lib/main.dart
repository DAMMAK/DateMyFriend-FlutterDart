import 'package:flutter/material.dart';
import 'package:my_match/members.dart';
import 'package:my_match/model/member_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0XFFE82219),
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _initialPage = 0;
  PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      image: DecorationImage(
                          image: AssetImage("images/banner.jpg"),
                          fit: BoxFit.cover)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    "Who knows you better than your friends",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    height: 80.0,
                    // color: Colors.lightGreenAccent,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (page) {},
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 20.0),
                              // hintStyle: TextStyle(fontSize: 20.0),
                              hintText: "Email address",
                              labelText: "Email address"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 20.0),
                              hintText: "Username",
                              labelText: "Username"),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 20.0),
                              hintText: "Password",
                              labelText: "Password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  MyButton(
                    onTap: () {
                      if (_initialPage == 2) {
                        return Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Members()));
                      }
                      _pageController.animateToPage(_initialPage + 1,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.linear);
                      setState(() {
                        _initialPage += 1;
                      });
                    },
                    height: 50.0,
                    width: width * 0.9,
                    title: "Next",
                    index: _initialPage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final int index;
  final double height;
  final double width;
  final String title;
  final Function onTap;

  MyButton(
      {@required this.height,
      @required this.title,
      @required this.width,
      this.onTap,
      this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Center(
            child: Text(
          index != 2 ? title : "Sign-Up",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )),
      ),
    );
  }
}
