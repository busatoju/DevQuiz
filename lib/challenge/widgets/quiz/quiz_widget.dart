import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(title, style: AppTextStyles.heading),
            SizedBox(height: 24),
            AnswerWidget(
                title:
                    'Possibilita a criação de aplicativos compilados nativamente'),
            AnswerWidget(
                title:
                    'Possibilita a criação de aplicativos compilados nativamente'),
            AnswerWidget(
                title:
                    'Possibilita a criação de aplicativos compilados nativamente'),
            AnswerWidget(
                title:
                    'Possibilita a criação de aplicativos compilados nativamente'),
            
            
          ],
        ),
      ),
    );
  }
}
