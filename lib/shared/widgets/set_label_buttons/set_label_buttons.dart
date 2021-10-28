import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'package:payflow/shared/widgets/devider_vertical/devider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrymaryColor;
  final bool enableSecondaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrymaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(children: [
        Divider(
          thickness: 1,
          height: 1,
          color: AppColors.stroke,
        ),
        Container(
          height: 56,
          child: Row(
            children: [
              Expanded(
                child: LabelButton(
                  label: primaryLabel,
                  onPressed: primaryOnPressed,
                  style: enablePrymaryColor ? TextStyles.buttonPrimary : null,
                ),
              ),
              DeviderVerticalWidget(),
              Expanded(
                child: LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryOnPressed,
                  style: enableSecondaryColor ? TextStyles.buttonPrimary : null,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
