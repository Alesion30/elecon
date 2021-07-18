import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elecon/data/model/floor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final floorDataSourceProvider = Provider((ref) => FloorDataSource(ref.read));

class FloorDataSource {
  FloorDataSource(this._reader);
  final Reader _reader;

  // firebase
  late final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late final floorsCollection = _firebaseFirestore.collection('floors');

  Future<List<Floor>> getData() async {
    final snapshot = await floorsCollection
        .orderBy(
          'floor',
          descending: true,
        )
        .get();

    final docs = snapshot.docs;
    final floorList = docs
        .map(
          (doc) => Floor.fromDocument(doc),
        )
        .toList();
    return floorList;
  }

  Stream<List<Floor>> getDataStream() async* {
    final snapshots = floorsCollection
        .orderBy(
          'floor',
          descending: true,
        )
        .snapshots();
    final floorList = snapshots.asyncMap((snapshot) {
      final docs = snapshot.docs;
      final floorList = docs.map((doc) => Floor.fromDocument(doc)).toList();
      return floorList;
    });
    yield* floorList;
  }
}
