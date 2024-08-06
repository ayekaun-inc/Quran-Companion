import 'package:quran_companion/global/services/size_helper_service.dart';
import 'package:quran_companion/global/themes/colors.dart';
import 'package:quran_companion/global/themes/fonts.dart';
import 'package:quran_companion/global/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextFormField(
        style: TextStyle(
          fontFamily: amiriRegular,
          fontSize: 15.sp,
          color: brown,
        ),
        cursorColor: brown,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            // TODO: Search prefix icon color change
            color: _isFocused ? brown : darkGray,
            size: 20.w,
          ),
          hintText: "Enter your desired word i.e ‘اللہ’",
          hintStyle: TextStyle(
            fontFamily: amiriRegular,
            fontSize: 15.sp,
            color: darkGray,
          ),
        ),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        onTapOutside: (event) => collapseKeyboard(context),
      ),
    );
  }
}
