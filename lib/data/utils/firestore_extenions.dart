import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/domain/models/app_user.dart';

extension Collections on FirebaseFirestore {
  CollectionReference<AppUser> get userCollection {
    return collection("users").withConverter<AppUser>(
        fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  Future<void> addUserFromCredential(UserCredential credential) {
    AppUser user = AppUser(
        id: credential.user!.uid,
        email: credential.user!.email,
        isAnonymous: credential.user!.isAnonymous);
    var userDoc = userCollection.doc(user.id);
    return userDoc.set(user);
  }
  Future<AppUser?> getUserById(String id) async {
    return (await userCollection.doc(id).get()).data();
  }
}
