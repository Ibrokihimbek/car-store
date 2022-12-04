import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_company/data/models/company_data/company_models.dart';
import 'package:car_company/data/models/data_from_id/car_info_model.dart';
import 'package:car_company/utils/app_colors.dart';
import 'package:car_company/view_model/company_view_model.dart';
import 'package:car_company/widgets/style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/post_indicator_widget.dart';

class CompanyInfoPage extends StatefulWidget {
  int car;
  CompanyInfoPage({super.key, required this.car});

  @override
  State<CompanyInfoPage> createState() => _CompanyInfoPageState();
}

class _CompanyInfoPageState extends State<CompanyInfoPage> {
  @override
  void initState() {
    super.initState();
    context.read<CompanyViewModel>().fatchCompanyInfofromId(id: widget.car);
  }

  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.C_FF5C00,
        ),
        elevation: 0,
        backgroundColor: AppColors.C_E5E5E5,
        centerTitle: true,
        title: Text(
          'Car Info',
          style: fontPoppinsW600(
            appcolor: AppColors.C_FF5C00,
          ).copyWith(fontSize: 28.sp),
        ),
      ),
      body: Consumer<CompanyViewModel>(
        builder: (context, companyViewModel, child) {
          return Center(
            child: companyViewModel.isLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12).r,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80.h,
                                child: Image.network(
                                    companyViewModel.carInfoModel!.logo),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Established year:  ${companyViewModel.carInfoModel!.establishedYear}',
                                    style:
                                        fontPoppinsW400(appcolor: Colors.black)
                                            .copyWith(fontSize: 14.sp),
                                  ),
                                  Text(
                                    'Average price:  ${companyViewModel.carInfoModel!.averagePrice}\$',
                                    style:
                                        fontPoppinsW400(appcolor: Colors.black)
                                            .copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 22.h),
                          SizedBox(
                            width: 400,
                            height: 230.h,
                            child: PageView.builder(
                              onPageChanged: (index) {
                                setState(
                                  () {
                                    currentIndex = index;
                                  },
                                );
                              },
                              physics: const BouncingScrollPhysics(),
                              controller: pageController,
                              itemCount:
                                  companyViewModel.carInfoModel!.carPics.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 80.h,
                                  child: CachedNetworkImage(
                                    imageUrl: companyViewModel
                                        .carInfoModel!.carPics[index],
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
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20).r,
                              child: PostIndicatorWidget(
                                currentIndex: currentIndex,
                                itemCount: companyViewModel
                                    .carInfoModel!.carPics.length,
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Text(
                            'Description',
                            style: fontPoppinsW600(
                              appcolor: AppColors.C_FF5C00,
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            child: Text(
                              companyViewModel.carInfoModel!.description,
                              style:
                                  fontPoppinsW400(appcolor: AppColors.C_8208F5)
                                      .copyWith(fontSize: 15.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
