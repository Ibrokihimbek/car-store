import 'package:car_company/screens/company_info/company_info_page.dart';
import 'package:car_company/screens/splash_page/splash_page.dart';
import 'package:car_company/view_model/company_view_model.dart';
import 'package:flutter/material.dart';

import 'home_page/home_page.dart';

abstract class RoutName {
  static const splash = 'splash';
  static const home = 'home';
  static const companyInfo = 'companyInfo';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RoutName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutName.companyInfo:
        return MaterialPageRoute(
          builder: (_) => CompanyInfoPage(
            viewModelModel: settings.arguments as CompanyViewModel,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
