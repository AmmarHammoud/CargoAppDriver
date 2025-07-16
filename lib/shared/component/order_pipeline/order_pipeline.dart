import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'order_pipeline_steps.dart';

class OrderPipeline extends StatelessWidget {
  const OrderPipeline({
    super.key,
    this.isHorizontal = true,
    this.stepRadius = 15.0,
  });

  final bool isHorizontal;
  final double stepRadius;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return EasyStepper(
      direction: isHorizontal ? Axis.horizontal : Axis.vertical,
      fitWidth: true,
      activeStep: 2,
      steps: currentOrderSteps(stepRadius: stepRadius * 0.9),
      stepShape: StepShape.circle,
      borderThickness: 2,
      stepRadius: stepRadius,
      finishedStepBorderColor: Constants.primaryColor,
      finishedStepBackgroundColor: Constants.primaryColor,
      activeStepBackgroundColor: Colors.orange[200],
      activeStepTextColor: Colors.yellow,
      finishedStepTextColor: Colors.black,
      showTitle: isHorizontal,
      showLoadingAnimation: false,
      internalPadding: 5.0,
      lineStyle: LineStyle(
        lineLength: isHorizontal ? screenWidth * 0.5 : screenHeight * 0.08,
      ),
    );
  }
}
