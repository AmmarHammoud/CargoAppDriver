import 'package:cargo_app_driver/shared/component/order_pipeline/order_pipeline_step.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

List<EasyStep> currentOrderSteps({
  required double stepRadius,
  required String senderName,
  required String receiverName,
}) {
  return [
    EasyStep(
      title: senderName,
      customStep: CurrentOrderStep(
        icon: Icons.person,
        stepRadius: stepRadius,
      ),
    ),
    // EasyStep(
    //   customStep: CurrentOrderStep(
    //     icon: Icons.fire_truck_outlined,
    //     stepRadius: stepRadius,
    //   ),
    // ),
    EasyStep(
      title: receiverName,
      customStep: CurrentOrderStep(
        icon: Icons.circle,
        stepRadius: stepRadius,
      ),
    ),
  ];
}
