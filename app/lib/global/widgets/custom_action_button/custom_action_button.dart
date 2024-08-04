import 'package:app/global/enums.dart';
import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/utils/svg_constants.dart';
import 'package:app/global/widgets/custom_action_button/custom_action_button_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class CustomActionButton extends StatelessWidget {
  final CustomActionButtonType type;
  const CustomActionButton({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomActionButtonViewModel(),
      builder: (context, viewModel, child) {
        return InkWell(
          onTap: viewModel.isBusy
              ? null
              : () => viewModel.onActionButtonTap(type: type),
          borderRadius: BorderRadius.circular(10.r),
          splashColor: green.withOpacity(0.1),
          child: SizedBox(
            width: 30.5.w,
            height: 30.5.h,
            child: Center(
              child: viewModel.isBusy
                  ? SizedBox(
                      width: 13.5.w,
                      height: 13.5.w,
                      child: CircularProgressIndicator(
                        color: green,
                        strokeWidth: 2.w,
                      ),
                    )
                  : type == CustomActionButtonType.note
                      ? SvgPicture.asset(
                          noteIcon,
                          width: 17.w,
                        )
                      : Icon(
                          Icons.save_alt_rounded,
                          color: green,
                          size: 21.w,
                        ),
            ),
          ),
        );
      },
    );
  }
}
