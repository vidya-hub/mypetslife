import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget phoneNumberWidget(TextEditingController controller) {
  return  ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      color: Color(0xffF0F0F0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          children: <Widget>[
            CountryPickerDropdown(
              initialValue: 'in',
              itemBuilder: _buildDropdownItem,
              onValuePicked: (Country country) {
                print("${country.phoneCode}");
              },
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.cancel),
                  border: InputBorder.none,
                  hintText: "Phone Number",
                ),
                onSubmitted: (value) {
                  // this.phoneNo=value;

                  print(value);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildDropdownItem(Country country) => Container(
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Text("+${country.phoneCode}"),
        ],
      ),
    );
