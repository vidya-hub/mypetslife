import 'package:flutter/material.dart';
import 'package:pets/Service/useridStore.dart';
import 'package:pets/add_scheduling_type/add_meals/add_meals.dart';
import 'package:pets/add_scheduling_type/add_walk/add_walk_screen.dart';

class SelectSchedulingType extends StatelessWidget {
  // final userdata;
  // SelectSchedulingType({this.userdata});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffebebeb),
        elevation: 0,
        title: Text(
          "Add Oreo’s Schedule",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color(0xffebebeb),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Meal Time",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    Text(
                      "Meals",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    SharedPref().read("userData").then((value) {
                      print(value["_id"]);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddMealsScreen(
                                    userid: value["_id"],
                                  )));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent, shape: BoxShape.circle),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Walk Time",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    Text(
                      "Walk",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    SharedPref().read("userData").then((value) {
                      print(value["_id"]);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddWalkScreen(
                                    userid: value["_id"],
                                  )));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent, shape: BoxShape.circle),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
