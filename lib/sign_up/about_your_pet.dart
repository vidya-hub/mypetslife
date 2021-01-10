import 'package:flutter/material.dart';
import 'package:pets/common/about_me_textField.dart';
import 'package:pets/common/app_bar.dart';
import 'package:pets/sign_up/pet_type.dart';

class AboutYourDogScreen extends StatelessWidget {
  var userdata;
  AboutYourDogScreen({this.userdata});
  TextEditingController dogNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context: context, name: ""),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20),
              child: Text(
                "Step 2 of 5",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20),
              child: Text(
                "About Your pet",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 33),
              ),
            ),
            aboutMeTextField(
                controller: dogNameController,
                header: "What's your dog's name?"),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 38.0, right: 20),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xff5A6CFA),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => PetType(
                                    petname: dogNameController.text,
                                    userdata: userdata,
                                  )));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
