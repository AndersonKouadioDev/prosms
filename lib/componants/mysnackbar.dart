import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';

SnackBar snacBarSuccess(
    {required Text title, required String btnlabel, Function? btnaction}) {
  return SnackBar(
    backgroundColor: psSuccessColor,
    content: title,
    action: SnackBarAction(
      label: btnlabel,
      onPressed: () => btnaction,
    ),
  );
}

SnackBar snackBarError(
    {required Text title, required String btnlabel, Function? btnaction}) {
  return SnackBar(
    backgroundColor: psErrorColor,
    content: title,
    action: SnackBarAction(
      label: btnlabel,
      onPressed: () => btnaction,
    ),
  );
}
