import 'package:flutter/material.dart';

class MemberData {
  final String name;
  final String address;
  final int age;
  final String imgUrl;

  MemberData(
      {@required this.address,
      @required this.age,
      @required this.name,
      @required this.imgUrl});
}

List<MemberData> memberListData() => [
      MemberData(
          address: "South Bank, Victoria",
          name: "Marina",
          age: 33,
          imgUrl: "member304.jpg"),
      MemberData(
          address: "Souel, Canada",
          name: "Juliet",
          age: 25,
          imgUrl: "member22.jpg"),
      MemberData(
          address: "Paris, France",
          name: "Michello",
          age: 22,
          imgUrl: "member44.jpg"),
      MemberData(
          address: "Souel, Canada",
          name: "Juliet",
          age: 20,
          imgUrl: "member5.jpg"),
      MemberData(
          address: "Vancouver, Canada",
          name: "Esther",
          age: 29,
          imgUrl: "member111.jpg"),
      MemberData(
          address: "Hanyoung, China",
          name: "Chi Young",
          age: 32,
          imgUrl: "member222.jpg"),
    ];
