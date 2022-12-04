import 'package:car_company/data/app_repositoriy/app_repository.dart';
import 'package:car_company/data/models/company_data/company_data.dart';
import 'package:car_company/data/models/data_from_id/car_info_model.dart';
import 'package:flutter/cupertino.dart';

class CompanyViewModel extends ChangeNotifier {
  late AppRepository _appRepository;
  CompanyViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
    fatchCompanyInfo();
  }
  bool isLoading = false;

  CompanyData? companyData;

  fatchCompanyInfo() async {
    notify(true);
    companyData = await _appRepository.getCompany();
    notify(false);
  }

  CarInfoModel? carInfoModel;

  fatchCompanyInfofromId({required int id}) async {
    notify(true);
    carInfoModel = await _appRepository.getInfoFromId(id: id);
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
