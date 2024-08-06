import 'package:quran_companion/global/widgets/dialogs/options_dialog/options_dialog_data.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/widgets/custom_elevated_button.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class OptionsDialog extends StatelessWidget {
  final DialogRequest request;
  final void Function(DialogResponse<void>) completer;
  const OptionsDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    OptionsDialogData data = request.data;
    return Dialog(
      child: Container(
        width: 280.w,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 24.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              label: data.option1,
              onPressed: data.onOption1Pressed,
            ),
            const VerticalGap(16),
            CustomElevatedButton(
              label: data.option2,
              onPressed: data.onOption2Pressed,
            ),
          ],
        ),
      ),
    );
  }
}
