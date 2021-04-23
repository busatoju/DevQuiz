import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  ResultPage({required this.title, required this.length, required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    'Parabéns!',
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                        text: 'Você concluiu',
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: '\n$title', style: AppTextStyles.bodyBold),
                          TextSpan(
                              text: '\ncom $result de $length acertos.',
                              style: AppTextStyles.body),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: NextButtonWidget.purple(
                            label: 'Compartilhar',
                            onTap: () {
                              Share.share(
                                  'DevQuiz Flutter\nResultado do Quiz: $title\nObtive ${(result / length) * 100}% de aproveitamento.');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: NextButtonWidget.transparent(
                            label: 'Voltar ao início',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
