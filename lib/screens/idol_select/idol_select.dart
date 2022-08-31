import 'package:flutter/material.dart';

import 'package:idoru/screens/test/test.dart';

class IdolSelectScreen extends StatefulWidget {
  const IdolSelectScreen({Key? key}) : super(key: key);

  @override
  State<IdolSelectScreen> createState() => _IdolSelectScreen();
}

class _IdolSelectScreen extends State<IdolSelectScreen> {
  List<List<dynamic>> searchList = [
    ["장원영/아이브", 0],
    ["조유리", 0],
    ["김채원/르세라핌", 0]
  ];
  List<String> selectList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              // padding: EdgeInsets.only(right: double.infinity),
              itemCount: selectList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFF27282B),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("wow");
                        },
                        child: Text(
                          selectList[index],
                          style: TextStyle(
                            fontFamily: 'Cafe24',
                            color: Color(0xFF72B8AB),
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(30),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFF27282B),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "아티스트 검색",
                      style: TextStyle(
                        fontFamily: 'Cafe24',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "아티스트",
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Cafe24',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 10,
                        right: 15,
                        bottom: 10,
                        left: 15,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Cafe24',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: searchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 40,
                          child: ListTile(
                            title: Text(
                              searchList[index][0],
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Cafe24',
                                color: searchList[index][1] == 0
                                    ? Colors.white
                                    : Color(0xFF72B8AB),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onTap: () {
                              if (searchList[index][1] == 0) {
                                selectList.add(searchList[index][0]);
                              } else {
                                selectList.remove(searchList[index][0]);
                              }
                              searchList[index][1] = 1 - searchList[index][1];
                              setState(
                                () => {},
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        side: BorderSide(
                          color: Color(0xFF72B8AB),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: selectList.isEmpty
                            ? Color(0xFF27282B)
                            : Color(0xFF72B8AB),
                      ),
                      child: Text(
                        "선택하기",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Cafe24',
                          color: selectList.isEmpty
                              ? Color(0xFF72B8AB)
                              : Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
