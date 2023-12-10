import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/app/extensions.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/add_bottom_sheet/add_view_model.dart';
import 'package:weight_tracker/presentation/utils/toast_utils.dart';
import 'package:weight_tracker/presentation/widgets/custom_filled_button.dart';
import 'package:weight_tracker/presentation/widgets/custom_text_field.dart';

class AddWeightBottomSheet extends StatefulWidget {
  const AddWeightBottomSheet({super.key});

  @override
  State<AddWeightBottomSheet> createState() => _AddWeightBottomSheetState();
}

class _AddWeightBottomSheetState extends State<AddWeightBottomSheet> {
  late AddWeightViewModel viewModel = getIt();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        print("State: $state");
        if (state is BaseErrorState) {
          ToastUtils.showErrorToast("Something went wrong while adding weight");
        } else if (state is BaseSuccessState) {
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.grayLight,
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
                "Add new weight!",
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
                  title: "Add",
                  onTap: () {
                    if (!formKey.currentState!.validate()) return;
                    viewModel.addWeight(double.parse(weightController.text));
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
