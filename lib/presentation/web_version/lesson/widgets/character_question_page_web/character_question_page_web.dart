import 'package:flutter/material.dart';
import 'package:note_book_app/domain/entities/question_entity.dart';

class CharacterQuestionPageWeb extends StatelessWidget {
  final List<QuestionEntity> questions;

  const CharacterQuestionPageWeb({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text(question.question),
            subtitle: Column(
              children: question.answers.map((answer) {
                return ElevatedButton(
                  onPressed: () {
                    // Handle answer selection logic
                  },
                  child: Text(answer),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
