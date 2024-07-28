import 'package:app/global/services/size_helper_service.dart';
import 'package:app/global/themes/colors.dart';
import 'package:app/global/themes/fonts.dart';
import 'package:app/global/widgets/horizontal_padding.dart';
import 'package:app/global/widgets/vertical_gap.dart';
import 'package:app/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: HorizontalPadding(
                padding: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalGap(13.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'The Quran Companion',
                          style: TextStyle(
                            color: brown,
                            fontSize: 15.sp,
                            fontFamily: poppinsSemiBold,
                          ),
                        ),
                      ],
                    ),
                    const VerticalGap(13.5),
                    Container(
                      width: double.maxFinite,
                      height: 208.h,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    const VerticalGap(15),
                    Text(
                      'Search for particular words in the verses',
                      style: TextStyle(
                        color: brown,
                        fontSize: 15.sp,
                        fontFamily: poppinsMedium,
                      ),
                    ),
                    const VerticalGap(15),
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
