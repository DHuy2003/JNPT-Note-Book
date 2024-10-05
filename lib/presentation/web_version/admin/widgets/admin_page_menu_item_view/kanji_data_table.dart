import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book_app/common/colors/app_colors.dart';
import 'package:note_book_app/domain/entities/kanji_entity.dart';
import 'package:note_book_app/presentation/web_version/admin/cubits/kanji_manager/kanji_manager_cubit.dart';
import 'package:note_book_app/presentation/web_version/admin/cubits/kanji_manager/kanji_manager_state.dart';

class KanjiDataTable extends StatefulWidget {
  final ScrollController scrollController;

  const KanjiDataTable({super.key, required this.scrollController});

  @override
  State<KanjiDataTable> createState() => _KanjiDataTableState();
}

class _KanjiDataTableState extends State<KanjiDataTable> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.black),
            right: BorderSide(color: AppColors.black),
            left: BorderSide(color: AppColors.black),
            top: BorderSide(color: AppColors.black),
          ),
        ),
        child: BlocBuilder<KanjiManagerCubit, KanjiManagerState>(
          builder: (context, state) {
            if (state is KanjiManagerLoaded) {
              return Column(
                children: [
                  _buildTableHeader(),
                  Expanded(
                    child: ListView.builder(
                      controller: widget.scrollController,
                      itemCount: state.kanjis.length,
                      itemBuilder: (context, index) {
                        return _buildTableRow(
                          index,
                          state.kanjis[index],
                          state.kanjis.length,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kDFD3C3,
        border: Border(
          bottom: BorderSide(color: AppColors.black),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                  border: Border(right: BorderSide(color: AppColors.black)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'STT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                  border: Border(right: BorderSide(color: AppColors.black)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Kanji',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                  border: Border(right: BorderSide(color: AppColors.black)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Âm Hán Việt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                  border: Border(right: BorderSide(color: AppColors.black)),
                ),
                child: const Text(
                  'Âm Kun',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                  border: Border(right: BorderSide(color: AppColors.black)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Âm On',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kDFD3C3,
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Thao tác',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow(int index, KanjiEntity kanji, int length) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                  right: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                  right: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                kanji.kanji,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                  right: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                kanji.viet,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                  right: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                kanji.kun,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                  right: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(
                kanji.on,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.black),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.kD0B8A8,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Sửa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (_isBottom()) {
      final state = context.read<KanjiManagerCubit>().state;
      if (state is KanjiManagerLoaded) {
        context.read<KanjiManagerCubit>().searchKanjis(
              hanVietSearchKey: state.searchKey,
            );
      }
    }
  }

  bool _isBottom() {
    if (!widget.scrollController.hasClients) return false;
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
