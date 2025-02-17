import 'package:dartz/dartz.dart';
import 'package:note_book_app/core/failures/failure.dart';
import 'package:note_book_app/core/failures/unknown_failure.dart';
import 'package:note_book_app/data/datasources/kanji_datasource.dart';
import 'package:note_book_app/domain/entities/kanji_entity.dart';
import 'package:note_book_app/domain/repositories/kanji_repository.dart';

class KanjiRepositoryImpl implements KanjiRepository {
  final KanjiDatasource kanjiDatasource;

  const KanjiRepositoryImpl({required this.kanjiDatasource});

  @override
  Future<Either<Failure, List<KanjiEntity>>> getAllKanjisByLevel({
    required String level,
    required int pageSize,
    required int pageNumber,
    required String hanVietSearchKey,
  }) async {
    try {
      final kanjis = await kanjiDatasource.getAllKanjisByLevel(
        level: level,
        pageSize: pageSize,
        pageNumber: pageNumber,
        hanVietSearchKey: hanVietSearchKey,
      );
      return Right(kanjis.map((kanji) => kanji.toEntity()).toList());
    } on Failure catch (e) {
      return Left(e);
    } on Exception {
      return Left(UnknownFailure());
    }
  }
}
