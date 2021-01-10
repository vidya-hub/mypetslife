import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pets/Service/api_service.dart';
import 'package:pets/common/about_me_textField.dart';
import 'package:pets/sign_up/welcome_dialog.dart';

class PetDetailsScreen extends StatefulWidget {
  final String petName;
  final String breedname;
  var userdata;

  PetDetailsScreen({this.petName, this.breedname, this.userdata});

  @override
  _PetDetailsScreenState createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  String _breedname = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      _breedController = TextEditingController(text: widget.breedname);
      // _breedname = widget.breedname;
    });
  }

  TextEditingController _breedController;

  TextEditingController _birthController = TextEditingController();

  TextEditingController _weightController = TextEditingController();

  String unitType = 'KG';
  String sexType = 'Male';
  String dobtext = "Click here to select Date of Birth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffebebeb),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 33),
              child: Text(
                "Step 5 of 5",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 32, bottom: 20),
              child: Text(
                "${widget.petName}’s Details",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 33),
              ),
            ),
            aboutMeTextField(controller: _breedController, header: "Breed"),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birth Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true, onConfirm: (date) {
                            setState(() {
                              dobtext = date.toString();
                            });
                            // print(date.toUtc().millisecondsSinceEpoch);
                            // timevalues.add(date.toUtc().millisecondsSinceEpoch);
                          }, currentTime: DateTime.now());
                        },
                        child: Text(
                          dobtext,
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
            // aboutMeTextField(
            //     controller: _birthController, header: "Birth Date"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: aboutMeTextField(
                        controller: _weightController, header: "Weight")),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28, top: 57),
                  child: new DropdownButton<String>(
                    value: unitType,
                    items: <String>['KG', 'GT'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        unitType = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 27),
              child: DropdownButton<String>(
                value: sexType,
                items: <String>['Male', 'Female'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    sexType = newValue;
                  });
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 140),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 8.0, right: 20, bottom: 60),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Let’s Onboard ${widget.petName}",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xff5A6CFA),
                    onPressed: () {
                      print(ApiService().userid);
                      welcomeDialog(context, widget.petName, widget.userdata);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drpDownWidget(String defaultValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28, top: 57),
      child: new DropdownButton<String>(
        value: defaultValue,
        items: <String>['KG', 'GT'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            defaultValue = newValue;
          });
        },
      ),
    );
  }
}
