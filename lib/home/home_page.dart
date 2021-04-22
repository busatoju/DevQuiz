import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button_widget/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {
              
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2;
    double cardHeight = MediaQuery.of(context).size.height / 3.7;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: controller.state == HomeState.success
          ? Scaffold(
              appBar: AppBarWidget(
                user: controller.user!,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LevelButtonWidget(
                            label: 'Fácil',
                          ),
                          LevelButtonWidget(
                            label: 'Médio',
                          ),
                          LevelButtonWidget(
                            label: 'Difícil',
                          ),
                          LevelButtonWidget(
                            label: 'Perito',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                        childAspectRatio: cardWidth / cardHeight,
                        children: controller.quizzes!
                            .map((e) => QuizCardWidget(
                                  title: e.title,
                                  percent:
                                      e.questionsAnswered / e.questions.length,
                                  completed:
                                      '${e.questionsAnswered} de ${e.questions.length}',
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
                ),
              ),
            ),
    );
  }
}
