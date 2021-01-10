class PetTypeModel {
  String name;
  String petImage;
  bool isSelected;

  PetTypeModel({this.name, this.petImage, this.isSelected});
}

final List<PetTypeModel> petYpeList = [
  PetTypeModel(
    name: "Dog",
    petImage: "assets/images/dogg.jpg",
    isSelected: false,
  ),
  PetTypeModel(
    name: "Cat",
    petImage: "assets/images/catt.jpg",
    isSelected: false,
  ),
  PetTypeModel(
    name: "Bird",
    petImage: "assets/images/birr.jpg",
    isSelected: false,
  ),
  PetTypeModel(
    name: "Others",
    petImage: "assets/images/ott.jpg",
    isSelected: false,
  ),
];
