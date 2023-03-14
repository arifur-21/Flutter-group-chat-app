import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_group_chat_app1/data/remote/firebase_remote_data_source.dart';
import 'package:flutter_group_chat_app1/data/remote/models/user_model.dart';
import 'package:flutter_group_chat_app1/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImpl(
      {required this.firestore,
      required this.auth,
      required this.googleSignIn});

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentuser(UserEntity user) async {
    final userCollection = firestore.collection("users");
    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
     print("remote data");
      final newUser = UserModel(
              gender: user.gender,
              isOnline: user.isOnline,
              name: user.name,
              phoneNumber: user.phoneNumber,
              profileUrl: user.profileUrl,
              status: user.status,
              email: user.email,
              dob: user.dob,
              uid: uid)
          .toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        print("new user : ${newUser}");
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;


  @override
  Future<void> getUpdateUser(UserEntity user) async {
    Map<String, dynamic> userInformation = Map();
    final userCollection = firestore.collection("users");

    if (user.profileUrl != null && user.profileUrl != "") {
      userInformation['profileUrl'] = user.profileUrl;
    }
    if (user.name != null && user.name != "") {
      userInformation['name'] = user.name;
    }
    if (user.status != null && user.status != "") {
      userInformation['status'] = user.status;
    }
    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity userEntity) async =>
      await auth.signInWithEmailAndPassword(
          email: userEntity.email!, password: userEntity.password!);

  @override
  Future<void> signUp(UserEntity userEntity) async {
    print(userEntity.email);
    auth.createUserWithEmailAndPassword(
        email: userEntity.email!, password: userEntity.password!);
  }

  @override
  Future<void> singOut() async => auth.signOut();

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = firestore.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }
}
