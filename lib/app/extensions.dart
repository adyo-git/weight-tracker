import 'package:flutter/material.dart';
import '../my_app.dart';

extension Sizer on num {

  double  get h {
    var h = MyApp.appContext.height;
    return (this / 100) * h;
  }

  double  get w {
    var w = MyApp.appContext.width;
    return (this / 100) * w;
  }

  double get sp => this * (MyApp.appContext.width / 3) / 100;
}

extension OnContext on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }
}