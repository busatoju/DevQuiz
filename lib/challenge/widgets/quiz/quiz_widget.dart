import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  QuizWidget({required this.question, required this.onSelected});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 64),
            Text(widget.question.title, style: AppTextStyles.heading),
            SizedBox(height: 24),
            for (int i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: answer(i),
                disabled: indexSelected != -1,
                isSelected: indexSelected == i,
                onTap: (value) {
                  indexSelected = i;

                  setState(() {});
                  Future.delayed(Duration(seconds: 1))
                      .then((_) => widget.onSelected(value));
                },
              ),
          ],
        ),
      ),
    );
  }
}
