import 'package:car_company/data/api_service/app_api.dart';
import 'package:car_company/data/app_repositoriy/app_repository.dart';
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
    AppRepository appRepository = AppRepository(apiService: ApiService());
    CompanyViewModel viewModelModel = CompanyViewModel(appRepository: appRepository);


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
      body: ChangeNotifierProvider(
        create: (context)=>viewModelModel,
        builder: (context,child){
        return  Consumer<CompanyViewModel>(
            builder: (context, companyViewModel, child) {
              return Center(
                child: companyViewModel.isLoading
                    ? const CircularProgressIndicator()
                    : Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: companyViewModel.companiesData.length,
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
                      var item = companyViewModel.companiesData[index];
                      return CompanyItamWidget(
                        company: companyViewModel.companiesData[index],
                        onTap: () {
                          companyViewModel.fatchCompanyInfofromId(
                              id: item.id);
                          Navigator.pushNamed(context, RoutName.companyInfo,arguments: viewModelModel);
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
