class UserModel {
  String? userId;
  String? firstName;
  String? secondName;
  String? email;
  String? phoneNumber;
  int? age;
  String? city;
  String? governorate;
  bool? helperMode;
  int? nationalId;
  String? password;
  String? userName;
  DateTime? registerTime;
  int? gender;

  UserModel({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.city,
    required this.governorate,
    required this.helperMode,
    required this.nationalId,
    required this.password,
    required this.userName,
    required this.gender,
    required this.userId,
    this.registerTime,
  });

  UserModel.fromFireStore(Map<String, dynamic> db) {
    userId = db['userId'];
    firstName = db['firstName'];
    secondName = db['secondName'];
    email = db['email'];
    phoneNumber = db['phoneNumber'];
    age = db['age'];
    city = db['city'];
    governorate = db['governorate'];
    helperMode = db['helperMode'];
    nationalId = db['nationalId'];
    password = db['password'];
    userName = db['userName'];
    registerTime = db['registerTime'];
    gender = db['gender'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'phoneNumber': phoneNumber,
      'age': age,
      'city': city,
      'governorate': governorate,
      'helperMode': helperMode,
      'nationalId': nationalId,
      'password': password,
      'userName': userName,
      'gender': gender,
      'registerTime': registerTime ?? DateTime.now(),
    };
  }
}
