import 'package:fluttertoast/fluttertoast.dart';
import 'package:weight_tracker/app/app_colors.dart';
import 'package:weight_tracker/domain/utils/constants.dart';

abstract class ToastUtils {
  static void showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        textColor: AppColors.white,
        backgroundColor: AppColors.errorToastBg);
  }
  static void showNetworkErrorToast() {
    Fluttertoast.showToast(
        msg: Constants.defaultNetworkErrorMessage,
        textColor: AppColors.white,
        backgroundColor: AppColors.errorToastBg);
  }
}
