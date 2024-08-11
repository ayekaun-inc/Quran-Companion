import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/ui_helpers.dart';
import 'package:quran_companion/global/widgets/bottom_sheets/note_bottom_sheet/note_bottom_sheet_view_model.dart';
import 'package:quran_companion/global/widgets/custom_elevated_button.dart';
import 'package:quran_companion/global/widgets/custom_text.dart';
import 'package:quran_companion/global/widgets/horizontal_padding.dart';
import 'package:quran_companion/global/widgets/vertical_gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NoteBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final void Function(SheetResponse<void>) completer;
  const NoteBottomSheet({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    int data = request.data as int;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NoteBottomSheetViewModel(ayatNumber: data),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return SafeArea(
          left: false,
          right: false,
          top: false,
          child: SingleChildScrollView(
            child: Container(
              height: 370.h,
              width: double.maxFinite,
              decoration: ShapeDecoration(
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                ),
              ),
              child: HorizontalPadding(
                padding: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalGap(16),
                    const _DragHandle(),
                    const VerticalGap(32),
                    const CustomText(
                      'Make a note',
                      size: 14,
                      color: brown,
                      font: poppinsMedium,
                    ),
                    const VerticalGap(8),
                    SizedBox(
                      height: 217.h,
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.text,
                        textAlignVertical: TextAlignVertical.top,
                        controller: viewModel.controller,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: poppinsMediumItalic,
                          color: green.withOpacity(0.9),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Your thoughts here...',
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: poppinsMediumItalic,
                            color: green.withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: green.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 9.h,
                          ),
                        ),
                        onTapOutside: (event) => collapseKeyboard(context),
                        onChanged: viewModel.onTextChange,
                      ),
                    ),
                    const VerticalGap(14),
                    CustomElevatedButton(
                      label: viewModel.isSavingNote ? 'Saving...' : 'Save',
                      labelSize: 14,
                      height: 37,
                      color:
                          !viewModel.isTextDifferent || viewModel.isSavingNote
                              ? darkGray
                              : green,
                      onPressed:
                          !viewModel.isTextDifferent || viewModel.isSavingNote
                              ? null
                              : viewModel.onSavePressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 48.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: green.withOpacity(0.369),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
    );
  }
}
