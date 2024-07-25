import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/core/exports.dart';

class ScoreCard extends StatelessWidget {
  final String name, category, question, score, date;
  final Color backgroundColor;

  const ScoreCard({
    super.key,
    required this.name,
    required this.category,
    required this.question,
    required this.score,
    required this.date,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name.toUpperCase(),
              style: GoogleFonts.anton(fontSize: 24, color: AppColors.secondaryColor,),
            ),
            const SizedBox(height: 8),
            Text('Category: $category'),
            const SizedBox(height: 8),
            Text('Total Questions: $question'),
            const SizedBox(height: 8),
            Text('Date: $date'),
            const SizedBox(height: 8),
            Text('Your Score: $score'),
          ],
        ),
      ),
    );
  }
}
