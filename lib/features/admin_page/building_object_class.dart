import 'package:image_picker/image_picker.dart';

class BuildingObject {
  String city;
  String address;
  String house;
  String apartment;
  String foreManName;
  bool isFinished;
  String? entrance;
  String? floor;
  String? foreManNumber;
  String? info;
  XFile? planningPicture;
  List<XFile>? pictures;

  // todo: add comments?

  BuildingObject(this.city, this.address, this.house, this.apartment,
      this.foreManName, this.isFinished,
      [this.entrance,
      this.floor,
      this.foreManNumber,
      this.info,
      this.planningPicture,
      this.pictures]);
}
