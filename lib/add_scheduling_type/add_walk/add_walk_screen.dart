import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pets/common/bottom_nav.dart';
import 'package:pets/sign_up/scheduling_time.dart';
import 'package:pets/Service/api_service.dart';

class AddWalkScreen extends StatefulWidget {
  final userid;
  AddWalkScreen({this.userid});
  @override
  _AddWalkScreenState createState() => _AddWalkScreenState();
}

class _AddWalkScreenState extends State<AddWalkScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.userid);
  }

  TextEditingController _walksNumberController =
      TextEditingController(text: "3");
  TextEditingController _walks1Controller =
      TextEditingController(text: "2:00:00 AM");
  TextEditingController _walks2Controller =
      TextEditingController(text: "2:00:00 AM");
  TextEditingController _walks3Controller =
      TextEditingController(text: "2:00:00 AM");
  bool isSwitched = false;
  List timevalues = [];
  List timeStamps = List.generate(3, (i) => "Set Walk ${i + 1} Date and Time");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              walkinfo("How many Walk", _walksNumberController, null),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return walkinfo(
                        timeStamps[index], _walks1Controller, index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.radio_button_off,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Repeat",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170.0),
                      child: Text("EveryDay",
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Reminder",
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(top: 98.0, right: 28),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Add Walk",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 19),
                      ),
                      color: Color(0xff5A6CFA),
                      onPressed: () {
                        print(timevalues);
                        // print(widget.userid);
                        ApiService()
                            .creatTask(
                                widget.userid.toString(), "walk", timevalues)
                            .then((response) {
                          print(response);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    BottomNavigation(),
                              ));
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget walkinfo(String desc, TextEditingController controller, index) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index != null
                ? "Set Walk ${index + 1} Date and Time"
                : "Set no of walks",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: desc == "How many Walk"
                ? TextField(
                    style: TextStyle(fontWeight: FontWeight.w800),
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(),
                  )
                : FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        setState(() {
                          timeStamps[index] = date.toString();
                        });
                        print(date.toUtc().millisecondsSinceEpoch);
                        timevalues.add(date.toUtc().millisecondsSinceEpoch);
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      '$desc',
                      style: TextStyle(color: Colors.blue),
                    )),
          )
        ],
      ),
    );
  }
}
