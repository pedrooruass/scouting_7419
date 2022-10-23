import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoring_7419/application/models/scoring_model.dart';

class ScoringRepository {
  Future<bool> submitScoring(ScoringModel scoring) async {
    return _put(scoring.id, scoring.toJson());
  }

  Future<bool> _put(String id, Map<String, dynamic> map) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('scoring');
    WriteBatch batch = FirebaseFirestore.instance.batch();
    batch.set(collectionReference.doc(id), map);
    await batch.commit();
    // submit google sheets
    return true;
  }
}
// google sheets here
