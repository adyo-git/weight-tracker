import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/presentation/screens/edit_weight_bottom_sheet/edit_weight_bottom_sheet.dart';
import 'package:weight_tracker/presentation/screens/home/home_view_model.dart';

class WeightWidget extends StatefulWidget {
  final Weight weight;

  const WeightWidget({super.key, required this.weight});

  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  late HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      _viewModel = BlocProvider.of(context);
      return Slidable(
        closeOnScroll: true,
        startActionPane: ActionPane(
          extentRatio: .2,
          motion: const BehindMotion(),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {
                  _viewModel.deleteWeight(widget.weight.id);
                },
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xff850008),
                  child: Column(
                    children: [
                      Spacer(),
                      Icon(Icons.delete, color: AppColors.white),
                      Text(
                        "Delete",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.white),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        child: InkWell(
          onTap: onItemClick,
          child: Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(22)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weight: ${widget.weight.weight.toString()}",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.weight.date.toString(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void onItemClick() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: EditWeightBottomSheet(weight: widget.weight),
            ));
  }
}
