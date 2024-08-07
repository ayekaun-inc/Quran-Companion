import 'package:flutter/material.dart';
import 'package:quran_companion/global/services/size_helper_service.dart';
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
    return Container(
      height: 50.h,
      width: double.maxFinite,
      color: Colors.amberAccent,
    );
  }
}
