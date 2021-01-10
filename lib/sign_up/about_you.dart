import 'package:flutter/material.dart';
import 'package:pets/Service/useridStore.dart';
import 'package:pets/common/about_me_textField.dart';
import 'package:pets/common/app_bar.dart';
import 'package:pets/sign_up/about_your_pet.dart';

class AboutYouScreen extends StatelessWidget {
  var userdata;
  AboutYouScreen({this.userdata});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
                "Step 1 of 5",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20),
              child: Text(
                "About You",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 33),
              ),
            ),
            aboutMeTextField(
                controller: firstNameController, header: "First Name"),
            aboutMeTextField(
                controller: lastNameController, header: "Last Name"),
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
                    onPressed: () async {
                      SharedPref().read("userData").then((value) {
                        print(value);
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AboutYourDogScreen(
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
