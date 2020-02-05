import 'package:flutter/material.dart';
import 'package:my_match/model/member_data.dart';

class MemberDetail extends StatefulWidget {
  final MemberData memberData;
  MemberDetail({this.memberData});
  @override
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  @override
  Widget build(BuildContext context) {
    MemberData memberData = widget.memberData;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height,
                ),
                Center(
                  child: Container(
                    height: height * 0.6,
                    width: width,
                    child: Hero(
                      tag: memberData.imgUrl,
                      child: Image.asset(
                        'images/${memberData.imgUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.45,
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              memberData.age.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
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
                ),
                Positioned(
                  top: height * 0.58,
                  child: Container(
                      height: height * 0.5,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1.0,
                                blurRadius: 1.0)
                          ],
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(18.0),
                              right: Radius.circular(18.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(
                                    'images/${memberData.imgUrl}',
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text("How my friend lana describe me",
                                      softWrap: true,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Aliqua amet anim consequat duis do. Laborum adipisicing commodo occaecat ipsum cupidatat esse excepteur. Esse Lorem aute commodo amet velit reprehenderit ad elit dolore et nisi cillum ut laboris. Reprehenderit dolor sunt non enim commodo esse eiusmod sint pariatur ut sit in officia. Nisi est anim laborum sunt ex labore ut aliqua est esse. Ad ex consequat in occaecat occaecat amet in Lorem id officia voluptate.",
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.0),
                            )
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0, left: 15.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.redAccent,
                      size: 35.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
