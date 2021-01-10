import 'package:flutter/material.dart';
import 'package:pets/Service/api_service.dart';
import 'package:pets/Service/useridStore.dart';
import 'package:pets/add_scheduling_type/select_scheduling_type.dart';

import 'package:intl/intl.dart';

class ScheduledTimeScreen extends StatefulWidget {
  @override
  _ScheduledTimeScreenState createState() => _ScheduledTimeScreenState();
}

class _ScheduledTimeScreenState extends State<ScheduledTimeScreen> {
  var data = [];
  String userid = "";

  void initState() {
    super.initState();
    SharedPref().read("userData").then((value) {
      ApiService().getTasks(value["_id"]).then((response) {
        print(response);
        SharedPref().save("userjsondata", response);
      });
    });
  }

  // Future gettheJsonData() async {
  //   var userdata;
  //   ApiService().getTasks(userid).then((response) {
  //     setState(() {
  //       userdata = response;
  //     });
  //   });
  //   // print(getJson);
  //   return userdata;
  //   // });
  // }
  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

  @override
  Widget build(BuildContext context) {
    String eatImage = "assets/images/updog2.png";
    String walkImage = "assets/images/updog1.png";
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Center(
                child: GestureDetector(
              onTap: () {
                // initState();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ScheduledTimeScreen(),
                    ));
              },
              child: Icon(
                Icons.refresh_rounded,
                color: Colors.black,
                size: 30,
              ),
            )),
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xffebebeb),
        title: Text(
          "Oreo’s Schedule",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 21),
        ),
      ),
      body: Column(
        children: [
          // morningWalkStack(walkImage),
          FutureBuilder(
            future: SharedPref().read("userjsondata"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List jsondata = snapshot.data;

                return Expanded(
                  child: jsondata.length == 0
                      ? Center(
                          child: Container(
                              child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Nothing",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )))
                      : ListView.builder(
                          itemCount: jsondata.length,
                          itemBuilder: (BuildContext context, int index) {
                            var dtServer = DateTime.fromMillisecondsSinceEpoch(
                                jsondata[index]["timeArray"][0]);

                            final diffmn =
                                DateTime.now().difference(dtServer).inMinutes;
                            print(diffmn);
                            return jsondata[index]["taskType"] == "walk"
                                ? walkTimeStack(
                                    walkImage,
                                    jsondata[index]["timeArray"].length,
                                    getTimeString(diffmn))
                                : feedTimeStack(
                                    eatImage,
                                    jsondata[index]["timeArray"].length,
                                    getTimeString(diffmn));
                          },
                        ),
                );

                //  walkTimeStack(walkImage, 1);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

          // walkTimeStack(walkImage, 1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectSchedulingType()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff8C9CFF),
      ),
    );
  }
}

// morningWalkStack(String petImage) {
//   return Stack(
//     alignment: Alignment.topLeft,
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(top: 28.0, left: 22, right: 22),
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//               height: 180,
//               width: double.infinity,
//               child: Card(
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(color: Colors.white70, width: 1),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   elevation: 3,
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xff2CC2DC),
//                                 border: Border.all(
//                                   color: Color(0xff2CC2DC),
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20))),
//                             child: Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: Text(
//                                 "Due In 30 Mins",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 24.0),
//                         child: Text(
//                           "Daily Morning Walk",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w800),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Oreo’s  ",
//                             style: TextStyle(
//                                 color: Color(0xff080040),
//                                 fontWeight: FontWeight.w800),
//                           ),
//                           Text("Walk is due in next 30 mins"),
//                         ],
//                       ),
//                       Text("Don’t forget to carry his favourite ball to play",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, color: Colors.grey)),
//                     ],
//                   ))),
//         ),
//       ),
//       Align(
//         alignment: Alignment.topCenter,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 40.0,
//             backgroundImage: AssetImage(petImage),
//           ),
//         ),
//       ),
//     ],
//   );
// }

feedTimeStack(String petImage, int noofFeeds, var timediff) {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 22, right: 22),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 140,
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffB122FF),
                                border: Border.all(
                                  color: Color(0xffB122FF),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "Due In ${timediff} Mins",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: Text(
                          "Feed Time",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chicken",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "$noofFeeds ounches",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0, top: 20),
          child: CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(petImage),
          ),
        ),
      ),
    ],
  );
}

walkTimeStack(String petImage, int noofWalks, var timediff) {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 22, right: 22),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 140,
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff2CC2DC),
                                border: Border.all(
                                  color: Color(0xff2CC2DC),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "Due In ${timediff} Mins",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: Text(
                          "Walk Time",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Garden",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "$noofWalks walk remaining",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0, top: 20),
          child: CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(petImage),
          ),
        ),
      ),
    ],
  );
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
