import 'package:car_company/data/models/company_data/company_data.dart';
import 'package:car_company/data/models/company_data/company_models.dart';
import 'package:car_company/screens/app_router.dart';
import 'package:car_company/screens/company_info/company_info_page.dart';
import 'package:car_company/screens/home_page/widgets/company_item_widget.dart';
import 'package:car_company/utils/app_colors.dart';
import 'package:car_company/view_model/company_view_model.dart';
import 'package:car_company/widgets/style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_E5E5E5,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.C_E5E5E5,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20).r,
            child: Text(
              'CarStore',
              style: fontPoppinsW600(
                appcolor: AppColors.C_FF5C00,
              ).copyWith(fontSize: 28.sp),
            ),
          ),
        ),
      ),
      body: Consumer<CompanyViewModel>(
        builder: (context, companyViewModel, child) {
          return Center(
            child: companyViewModel.isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: companyViewModel.companyData!.data.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 3.5,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return CompanyItamWidget(
                          company: companyViewModel.companyData!.data[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CompanyInfoPage(
                                  car: companyViewModel
                                      .companyData!.data[index].id,
                                ),
                              ),
                            );

                            // Navigator.pushNamed(
                            //   context,
                            //   RoutName.companyInfo,
                            //   arguments: {
                            //     'productInfo': companyViewModel
                            //         .companyData!.data[index].id,
                            //   },
                            // );
                          },
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
