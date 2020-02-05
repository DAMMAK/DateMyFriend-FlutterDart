import 'package:flutter/material.dart';
import 'package:my_match/member_detail.dart';
import 'package:my_match/model/member_data.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<MemberData> data = memberListData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "DateMyFriend",
            style: TextStyle(
                // backgroundColor: Colors.blue,
                color: Theme.of(context).primaryColor,
                fontSize: 22.0),
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              color: Colors.pinkAccent,
            ),
            SizedBox(
              width: 20.0,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text("Browse"), icon: Icon(Icons.usb)),
            BottomNavigationBarItem(
              title: Text("Contacts"),
              icon: Icon(Icons.video_call),
            ),
            BottomNavigationBarItem(
                title: Text("Friends"), icon: Icon(Icons.wifi)),
            BottomNavigationBarItem(
                title: Text("User Profile"), icon: Icon(Icons.timer))
          ],
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              MemberDetail(memberData: data[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: MemberCard(
                      height: height * 0.6,
                      width: width * 0.9,
                      memberData: data[index]),
                ),
              );
            }));
  }
}

class MemberCard extends StatelessWidget {
  final double height;
  final double width;
  final MemberData memberData;

  MemberCard(
      {@required this.height, @required this.width, @required this.memberData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: height,
            width: width,
            child: Hero(
              tag: memberData.imgUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  'images/${memberData.imgUrl}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 0.8,
          left: width * 0.1,
          child: Container(
            width: width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      memberData.name,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      memberData.age.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    Icon(
                      Icons.markunread_mailbox,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  memberData.address,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
