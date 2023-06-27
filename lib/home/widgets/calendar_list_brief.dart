import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarListBriefView extends StatefulWidget {
  const CalendarListBriefView({super.key});

  @override
  State<CalendarListBriefView> createState() => _CalendarListBriefViewState();
}

class _CalendarListBriefViewState extends State<CalendarListBriefView> {
  List<String> dummyData = ["1","2","4","23","26","29","31"];
  List<String> dummyDataMonth = ["Aug","Aug","Aug","Sep","Dec","Dec","Jan"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Color.fromARGB(150, 0, 0, 0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.8, 1.0]
        )
      ),
      child: Scrollbar(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 75.0,
              child: Container(
                margin: EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,  // sets parent width to child
                        margin: EdgeInsets.all(3.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.grey,
                        ),
                        child: const Text(""),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(3.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.blueGrey,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                dummyDataMonth[index],
                                style: TextStyle(
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                dummyData[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
