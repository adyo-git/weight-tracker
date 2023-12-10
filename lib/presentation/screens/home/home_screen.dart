import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/domain/models/weight.dart';
import 'package:weight_tracker/domain/utils/constants.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/add_bottom_sheet/add_weight_bottom_sheet.dart';
import 'package:weight_tracker/presentation/screens/home/home_view_model.dart';
import 'package:weight_tracker/presentation/screens/home/states.dart';
import 'package:weight_tracker/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:weight_tracker/presentation/utils/toast_utils.dart';
import 'package:weight_tracker/presentation/widgets/app_bar.dart';
import 'package:weight_tracker/presentation/widgets/loading_view.dart';
import 'package:weight_tracker/presentation/widgets/weight_widget.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is BaseErrorState) {
            ToastUtils.showErrorToast(state.errorMessage);
          } else if (state is UserSignedOutState) {
            Navigator.pushReplacementNamed(context, SignInScreen.id);
          }
        },
        child: Scaffold(
          appBar: DefaultAppBar(
            title: "Home",
            actions: [
              IconButton(
                  onPressed: () {
                    viewModel.signOut();
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: StreamBuilder<QuerySnapshot<Weight>>(
            stream: viewModel.weightStream,
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return buildWeightsList(
                    snapshots.data!.docs.map((e) => e.data()).toList());
              } else if (snapshots.hasError) {
                if (kDebugMode) {
                  print(
                      "_HomeScreenState.StreamBuilder: Error while loading data, ${snapshots.error}");
                }
                return ErrorWidget(Constants.defaultErrorMessage);
              } else {
                return const LoadingView();
              }
            },
          ),
          floatingActionButton: buildAddFab,
        ),
      ),
    );
  }

  Widget buildWeightsList(List<Weight> weights) {
    return weights.isEmpty
        ? listEmptyView
        : Column(children: [
            Expanded(
                child: ListView.builder(
                    itemCount: weights.length,
                    itemBuilder: (context, index) =>
                        WeightWidget(weight: weights[index])))
          ]);
  }

  Widget get listEmptyView => const Center(
        child: Text("There are no added weights yet."),
      );

  get buildAddFab => FloatingActionButton(
      backgroundColor: AppColors.mainColor,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) => Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: const AddWeightBottomSheet()));
      },
      child: const Icon(Icons.add));
}
