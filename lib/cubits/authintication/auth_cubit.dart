import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_app/Models/user/user_model.dart';
import 'package:pulse_app/Models/user_network/contacts_model.dart';
import 'package:pulse_app/Shared/Network/Local/cache_keys.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';

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
    required String city,
    required String governorate,
    required bool helperMode,
    required bool language,
    required int nationalId,
    required String password,
  }) {
    emit(AuthRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(
        key: USER_ID,
        value: value.user!.uid,
      );
      UserModel userModel = UserModel(
        firstName: firstName,
        secondName: secondName,
        userName: firstName +
            '_' +
            nationalId.toString()[0] +
            nationalId.toString()[1] +
            nationalId.toString()[2] +
            nationalId.toString()[3],
        email: email,
        phoneNumber: phoneNumber,
        age: age,
        city: city,
        governorate: governorate,
        helperMode: helperMode,
        language: language,
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
  void getMyNetwork() {
    String uid = CacheHelper.getData(key: USER_ID);
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
      emit(AuthGetNetworkSuccessState());
    });
  }

  void addToMyNetwork({
    required userName,
    required photo,
    required phoneNumber,
  }) {
    emit(AuthAddToMyNetworkLoadingState());
    String uid = CacheHelper.getData(key: USER_ID);
    ContactModel contactModel = ContactModel(
      userName: userName,
      photo: photo,
      phoneNumber: phoneNumber,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('network')
        .add(contactModel.toMap())
        .then((value) {
      emit(AuthAddToMyNetworkSuccessState());
    }).catchError((onError) {
      emit(AuthAddToMyNetworkErrorState());
    });
  }
}
