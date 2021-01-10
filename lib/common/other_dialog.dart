import 'package:flutter/material.dart';
import 'package:pets/sign_up/scheduling_time.dart';
import 'package:pets/common/about_me_textField.dart';
import 'package:pets/sign_up/pet_details_last.dart';

otherPetDialog(BuildContext context,String petName,TextEditingController customPetName) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          //this right here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.clear))),
                  aboutMeTextField(header: "$petName Type",controller: customPetName),
                  aboutMeTextField(header: "Breed Type"),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Color(0xff080040)),
                          ),
                          color: Colors.white54,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PetDetailsScreen(petName: petName,),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
