class ContactModel {
  String? userName;
  int? phoneNumber;
  String? photo;
  ContactModel({
    required this.userName,
    required this.photo,
    required this.phoneNumber,
  });
  ContactModel.fromFireStore(Map<String, dynamic> db) {
    userName = db['userName'];
    phoneNumber = db['phoneNumber'];
    photo = db['photo'];
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'photo': photo,
    };
  }
}