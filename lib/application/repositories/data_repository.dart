import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/data_model.dart';

class DataRepository {
  StreamSubscription? _streamSubscription;

  startListenTeamDataInTournament({required int teamNumber, required String tournamentKey, required Function(DataRepositoryEvent event) onEvent}) async {
    // return FirebaseFirestore.instance.collection("scoring").where("tournamentKey", isEqualTo: tournamentKey).where("teamNumber", isEqualTo: teamNumber).snapshots().map((snapshot) => snapshot.docs.map((doc) => DataModel.fromJson(doc.data())).toList());
    _streamSubscription = FirebaseFirestore.instance.collection("scoring").where("tournamentKey", isEqualTo: tournamentKey).where("teamNumber", isEqualTo: teamNumber).snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          onEvent(DataRepositoryEvent(DataRepositoryEventType.added, DataModel.fromJson(change.doc.data()!)));
        } else if (change.type == DocumentChangeType.modified) {
          onEvent(DataRepositoryEvent(DataRepositoryEventType.modified, DataModel.fromJson(change.doc.data()!)));
        } else if (change.type == DocumentChangeType.removed) {
          onEvent(DataRepositoryEvent(DataRepositoryEventType.removed, DataModel.fromJson(change.doc.data()!)));
        }
      }
    });
  }

  stopListenTeamDataInTournament() {
    _streamSubscription?.cancel();
  }
}

enum DataRepositoryEventType { added, modified, removed }

class DataRepositoryEvent {
  final DataRepositoryEventType eventType;
  final DataModel dataModel;

  DataRepositoryEvent(this.eventType, this.dataModel);
}
