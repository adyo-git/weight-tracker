import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/app/extensions.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/edit_weight_bottom_sheet/edit_weight_view_model.dart';
import 'package:weight_tracker/presentation/utils/toast_utils.dart';
import 'package:weight_tracker/presentation/widgets/custom_filled_button.dart';
import 'package:weight_tracker/presentation/widgets/custom_text_field.dart';

class EditWeightBottomSheet extends StatefulWidget {
  final Weight weight;

  const EditWeightBottomSheet({super.key, required this.weight});

  @override
  State<EditWeightBottomSheet> createState() => _EditWeightBottomSheetState();
}

class _EditWeightBottomSheetState extends State<EditWeightBottomSheet> {
  late EditWeightViewModel viewModel = getIt();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController weightController;

  @override
  void initState() {
    super.initState();
    weightController =
        TextEditingController(text: widget.weight.weight.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is BaseErrorState) {
          ToastUtils.showErrorToast("Something went wrong while adding weight");
        } else if (state is BaseSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.grayLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 1.h,
              ),
              const Text(
                "Edit",
                style: TextStyle(fontSize: 18, color: AppColors.mainColor),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: weightController,
                hintText: "Please enter your weight here",
                validator: (weight) {
                  try {
                    int.parse(weight!);
                    return null;
                  } on Exception {
                    return "Please enter valid number";
                  }
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomFilledButton(
                  title: "Edit",
                  onTap: () {
                    if (!formKey.currentState!.validate()) return;
                    viewModel.editWeight(
                        widget.weight.id, double.parse(weightController.text));
                  }),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
