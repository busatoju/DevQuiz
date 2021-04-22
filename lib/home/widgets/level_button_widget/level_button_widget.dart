import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'fontColor': AppColors.levelButtonTextFacil,
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'fontColor': AppColors.levelButtonTextMedio,
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'fontColor': AppColors.levelButtonTextDificil,
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'fontColor': AppColors.levelButtonTextPerito,
    }
  };
  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;
  LevelButtonWidget({
    required this.label,
  }) : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label));

  @override
  Widget build(BuildContext context) {
     double width = (MediaQuery.of(context).size.width / 4) - 72;
    return Container(
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: borderColor)),
          borderRadius: BorderRadius.circular(28),
          color: color),
      child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width, vertical: 6),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(color: fontColor),
          )),
    );
  }
}
