import 'package:car_company/data/models/company_data/company_models.dart';
import 'package:car_company/utils/app_colors.dart';
import 'package:car_company/widgets/style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CompanyItamWidget extends StatelessWidget {
  CompanyModel company;
  VoidCallback onTap;
  CompanyItamWidget({super.key, required this.company, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8).r,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.C_FF5C00.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80.h,
                  child: CachedNetworkImage(
                    imageUrl: company.logo,
                    fit: BoxFit.contain,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        period: const Duration(seconds: 2),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 120,
                          height: 100,
                          color: Colors.white,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  company.carModel,
                  style: fontPoppinsW600(appcolor: AppColors.C_FF5C00)
                      .copyWith(fontSize: 22.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Average price ${company.averagePrice}',
                  style: fontPoppinsW400(appcolor: Colors.black)
                      .copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Established year ${company.establishedYear}',
                  style: fontPoppinsW400(appcolor: AppColors.C_8208F5)
                      .copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
