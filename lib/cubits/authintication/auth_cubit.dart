import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pulse_app/Models/user/user_model.dart';
import 'package:pulse_app/Models/user_network/contacts_model.dart';
import 'package:pulse_app/Shared/Network/Local/cache_keys.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/patient/patient_model.dart';
import '../../Shared/Network/Local/cache_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) {
    emit(AuthLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CacheHelper.saveData(
        key: USER_ID,
        value: value.user!.uid,
      );
      emit(AuthLoginSuccessState());
    }).catchError((onError) {
      emit(AuthLoginErrorState());
    });
  }

  void register({
    required String firstName,
    required String secondName,
    required String email,
    required String phoneNumber,
    required int age,
    required int gender,
    required String city,
    required String governorate,
    required int nationalId,
    required String password,
  }) {
    emit(AuthRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      String userName = firstName +
          '_' +
          nationalId.toString()[10] +
          nationalId.toString()[11] +
          nationalId.toString()[12] +
          nationalId.toString()[13];
      CacheHelper.saveData(
        key: USER_ID,
        value: value.user!.uid,
      );
      CacheHelper.saveData(
        key: USER_NAME,
        value: userName,
      );
      UserModel userModel = UserModel(
        userId: value.user!.uid,
        firstName: firstName,
        secondName: secondName,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        age: age,
        city: city,
        governorate: governorate,
        helperMode: false,
        nationalId: nationalId,
        password: password,
        registerTime: value.user!.metadata.creationTime ?? DateTime.now(),
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .set(userModel.toMap())
          .then((value) {
        emit(AuthRegisterSuccessState());
      }).catchError((onError) {
        emit(AuthRegisterErrorState());
      });
    }).catchError((onError) {
      emit(AuthRegisterErrorState());
    });
  }

  List<ContactModel> contacts = [];
  bool contact_error = false;
  void getMyNetwork() {
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('network')
        .get()
        .then((value) {
      contacts.clear();
      for (var element in value.docs) {
        contacts.add(ContactModel.fromFireStore(element.data()));
      }
      contact_error = false;
      emit(AuthGetNetworkSuccessState());
    }).catchError((onError) {
      contact_error = true;
    });
  }

  void addToMyNetwork({
    required ContactModel contact,
  }) {
    emit(AuthAddToMyNetworkLoadingState());
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    ContactModel contactModel = ContactModel(
      userName: contact.userName,
      photo: contact.photo,
      phoneNumber: contact.phoneNumber,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('network')
        .doc(contact.userName)
        .set(contactModel.toMap())
        .then((value) {
      emit(AuthAddToMyNetworkSuccessState());
    }).catchError((onError) {
      emit(AuthAddToMyNetworkErrorState());
    });
  }

  void removeFromMyNetwork({
    required String userName,
  }) {
    emit(AuthRemoveFromMyNetworkLoadingState());
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('network')
        .doc(userName)
        .delete()
        .then((value) {
      emit(AuthRemoveFromMyNetworkSuccessState());
    }).catchError((onError) {
      emit(AuthRemoveFromMyNetworkErrorState());
    });
  }

  void changePrivacy({
    required int privacyStatue,
  }) {
    emit(AuthChangePrivacyLoadingState());
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      String userName = value.data()!['userName'];
      FirebaseDatabase.instance.ref('patients/$userName').update({
        'privacy': privacyStatue,
      }).then((value) {
        emit(AuthChangePrivacySuccessState());
      }).catchError((onError) {
        emit(AuthChangePrivacyErrorState());
      });
    }).catchError((onError) {
      emit(AuthChangePrivacyErrorState());
    });
  }

  void activeHelperMode() {
    emit(AuthActiveHelperLoadingState());
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'helperMode': true,
    }).then((value) {
      emit(AuthActiveHelperSuccessState());
    }).catchError((error) {
      emit(AuthActiveHelperErrorState());
    });
  }

  void addToMySavedPeopleCollection({
    required ContactModel contact,
  }) {
    emit(AuthAddToMyNetworkLoadingState());
    String uid = CacheHelper.getData(key: USER_ID) ?? 'ff';
    ContactModel contactModel = ContactModel(
      userName: contact.userName,
      photo: contact.photo,
      phoneNumber: contact.phoneNumber,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('savedPeople')
        .doc(contact.userName)
        .set(contactModel.toMap())
        .then((value) {
      emit(AuthAddToMyNetworkSuccessState());
    }).catchError((onError) {
      emit(AuthAddToMyNetworkErrorState());
    });
  }

  PatientModel? patientModel;
  List<History> healthHistory = [];
  void getPatientProfile({required String userName}) {
    emit(AuthGetPatientProfileLoadingState());
    FirebaseDatabase.instance.ref('patients/$userName').onValue.listen((event) {
      patientModel = PatientModel.fromDataBase(
          event.snapshot.value as Map<dynamic, dynamic>);
      healthHistory.clear();
      event.snapshot.child('history').children.forEach((element) {
        healthHistory
            .add(History.fromDataBase(element.value as Map<dynamic, dynamic>));
      });
    });
    emit(AuthGetPatientProfileSuccessState());
  }

  void addToHealthHistory({
    required String userName,
    required History history,
  }) {
    emit(AuthAddToPatientHistoryLoadingState());
    FirebaseDatabase.instance
        .ref('patients/$userName/history')
        .push()
        .set(history.toMap())
        .then((value) {
      emit(AuthAddToPatientHistorySuccessState());
    }).catchError((onError) {
      emit(AuthAddToPatientHistoryErrorState());
    });
  }

  void sendCurrentLocationViaWhatsapp({
    required String phoneNumber,
    required double lat,
    required double long,
  }) {
    String whatsappPhone = phoneNumber;
    String locationUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    String whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsappPhone + "&text=$locationUrl";
    String whatsappURLIos =
        "https://wa.me/$whatsappPhone?text=${Uri.parse("hello")}";
    if (Platform.isAndroid) {
      launch(whatsappURlAndroid).then((value) {
        Fluttertoast.showToast(msg: 'send message');
      });
    } else {
      launch(whatsappURLIos, forceSafariVC: false).then((value) {
        Fluttertoast.showToast(msg: 'send message');
      });
    }
  }
}
