import 'package:cloud_firestore/cloud_firestore.dart';

class KanjiEntity {
  final String id;
  final String kanji;
  final String kun;
  final String on;
  final String viet;
  final Timestamp createdAt;

  const KanjiEntity({
    required this.id,
    required this.kanji,
    required this.kun,
    required this.on,
    required this.viet,
    required this.createdAt,
  });
}
