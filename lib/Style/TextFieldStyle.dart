import 'package:crud_app/Style/ColorStyle.dart';
import 'package:flutter/material.dart';

InputDecoration AppInputDecoretion(label){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen,width: 1),
          borderRadius: BorderRadius.circular(10),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: colorWhite,width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
      border: const OutlineInputBorder(),
    labelText: label

  );
}