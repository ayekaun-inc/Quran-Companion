import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchTextField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        style: TextStyle(
          fontFamily: poppinsRegular,
          fontSize: 15.sp,
          color: darkGray,
        ),
        cursorColor: brown,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: darkGray,
            size: 20.w,
          ),
          hintText: "Enter your desired word i.e ‘Rizq’",
          hintStyle: TextStyle(
            fontFamily: poppinsRegular,
            fontSize: 15.sp,
            color: darkGray,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
