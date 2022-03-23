class UserModel {
  String? firstName;
  String? secondName;
  String? email;
  String? phoneNumber;
  int? age;
  String? city;
  String? governorate;
  bool? helperMode;
  bool? language;
  int? nationalId;
  String? password;
  String? userName;
  DateTime? registerTime;

  UserModel({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.city,
    required this.governorate,
    required this.helperMode,
    required this.language,
    required this.nationalId,
    required this.password,
    required this.userName,
    this.registerTime,
  });

  UserModel.fromFireStore(Map<String, dynamic> db) {
    firstName = db['firstName'];
    secondName = db['secondName'];
    email = db['email'];
    phoneNumber = db['phoneNumber'];
    age = db['age'];
    city = db['city'];
    governorate = db['governorate'];
    helperMode = db['helperMode'];
    language = db['language'];
    nationalId = db['nationalId'];
    password = db['password'];
    userName = db['userName'];
    registerTime = db['registerTime'];
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
      'language': language,
      'nationalId': nationalId,
      'password': password,
      'userName': userName,
      'registerTime': registerTime ?? DateTime.now(),
    };
  }
}
