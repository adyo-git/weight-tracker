import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:weight_tracker/domain/models/app_user.dart';
import 'package:weight_tracker/domain/models/weight.dart';

@injectable
class FirestoreServices {
  final FirebaseFirestore _firestore;

  FirestoreServices(this._firestore);

  CollectionReference<AppUser> get userCollection {
    return _firestore.collection("users").withConverter<AppUser>(
        fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  Future<void> addUserFromCredential(
      String id, String email, bool isAnonymous) {
    AppUser user = AppUser(id: id, email: email, isAnonymous: isAnonymous);
    var userDoc = userCollection.doc(user.id);
    return userDoc.set(user);
  }

  CollectionReference<Weight> getUserWeightsCollection(String id) {
    return (userCollection.doc(id)).collection("weights").withConverter<Weight>(
        fromFirestore: (snapshot, _) => Weight.fromJson(snapshot.data()!),
        toFirestore: (weight, _) => weight.toJson());
  }
}
