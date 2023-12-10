import 'package:flutter/material.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/domain/models/weight.dart';

class WeightWidget extends StatelessWidget {
  final Weight weight;

  const WeightWidget({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weight.weight.toString(),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
          Text(
            weight.date.toString(),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
