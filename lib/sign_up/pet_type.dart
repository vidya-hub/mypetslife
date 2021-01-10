import 'package:flutter/material.dart';
import 'package:pets/DataModel/pet_type_model.dart';
import 'package:pets/common/about_me_textField.dart';
import 'package:pets/common/app_bar.dart';
import 'package:pets/sign_up/select_breed.dart';
import 'package:pets/common/other_dialog.dart';

class PetType extends StatefulWidget {
  final String petname;
  var userdata;

  PetType({this.petname, this.userdata});

  @override
  _PetTypeState createState() => _PetTypeState();
}

class _PetTypeState extends State<PetType> {
  TextEditingController dogNameController = TextEditingController();
  TextEditingController customPetTypeController = TextEditingController();
  int currentSelectedIndex;
  String categoryName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xfffafafa),
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
        backgroundColor: Color(0xfffafafa),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 20),
              child: Text(
                "Step 3 of 5",
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20, bottom: 70),
              child: Text(
                "${widget.petname} is",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 33),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 38.0),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 10 / 10,
                  children: List.generate(petYpeList.length, (index) {
                    return PetTypeTile(
                      name: petYpeList[index].name,
                      petImage: petYpeList[index].petImage,
                      isSelected: currentSelectedIndex == index,
                      onPressed: () {
                        setState(() {
                          currentSelectedIndex = index;
                          categoryName = petYpeList[index].name;
                          print(currentSelectedIndex);
                        });
                      },
                    );
                  }),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 8.0, right: 20, bottom: 60),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xff5A6CFA),
                    onPressed: () {
                      if (categoryName == "Others") {
                        otherPetDialog(
                            context, widget.petname, customPetTypeController);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SelectBreedScreen(
                                      category: categoryName,
                                      petName: widget.petname,
                                      userdata: widget.userdata,
                                    )));
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}

class PetTypeTile extends StatelessWidget {
  final String name;
  final String petImage;
  final bool isSelected;
  final Function onPressed;

  PetTypeTile({this.petImage, this.name, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 39),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 140,
                  width: 130,
                  child: Card(
                      color:
                          isSelected == true ? Colors.blueAccent : Colors.white,
                      elevation: 3,
                      child: Center(
                          child: Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      )))),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(petImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget choosePetStack() {
  return Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 39),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 140,
              width: 130,
              child: Card(
                  elevation: 10,
                  child: Center(
                      child: Text(
                    "Dog",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  )))),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(
                "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-1100x628.jpg"),
          ),
        ),
      ),
    ],
  );
}
