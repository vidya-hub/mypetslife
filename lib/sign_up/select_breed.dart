import 'package:flutter/material.dart';
import 'package:pets/common/app_bar.dart';
import 'package:pets/sign_up/pet_details_last.dart';
import 'package:pets/DataModel/breed_model.dart';

class SelectBreedScreen extends StatefulWidget {
  final String petName;
  final String category;
  var userdata;

  SelectBreedScreen({this.petName, this.category, this.userdata});

  @override
  _SelectBreedScreenState createState() => _SelectBreedScreenState();
}

class _SelectBreedScreenState extends State<SelectBreedScreen> {
  static var _selectedBreeds = [];
  int currentSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xffebebeb),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Text(
              "Step 4 of 5",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 32, bottom: 20),
            child: Text(
              "Select ${widget.petName}'s Breed",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 33),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: inputDecoration(),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: breedModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return breedModel[index].category == widget.category
                          ? BreedTile(
                              breedName: breedModel[index].breedName,
                              isSelected: currentSelectedIndex == index,
                              onPressed: () {
                                // print();
                                setState(() {
                                  _selectedBreeds.clear();
                                  _selectedBreeds
                                      .add(breedModel[index].breedName);
                                  currentSelectedIndex = index;
                                });
                              },
                            )
                          : SizedBox();
                    }),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 17.0, right: 18, left: 18),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.45,
          //     color: Colors.white,
          //     child: ListView(
          //       children: [
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //         breadList(),
          //         dividerCustom(),
          //       ],
          //     ),
          //   ),
          // ),
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
                    print(_selectedBreeds);
                    if (_selectedBreeds != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PetDetailsScreen(
                                      petName: widget.petName,
                                      userdata: widget.userdata,
                                      breedname: _selectedBreeds[0])));
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecoration({String hintName}) {
    return InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: Colors.grey)),
        border: OutlineInputBorder(),
        hintText: hintName,
        hintStyle: TextStyle(color: Colors.grey));
  }

  breadList() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Text(
        "Bread1",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  dividerCustom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(),
    );
  }
}

class BreedTile extends StatefulWidget {
  final String breedName;
  final bool isSelected;
  final Function onPressed;

  BreedTile({this.breedName, this.isSelected, this.onPressed});

  @override
  _BreedTileState createState() => _BreedTileState();
}

class _BreedTileState extends State<BreedTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.080,
        child: Card(
          color: widget.isSelected ? Colors.blueAccent : Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    widget.breedName,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
