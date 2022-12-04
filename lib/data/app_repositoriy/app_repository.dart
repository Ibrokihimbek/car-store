import 'package:car_company/data/api_service/app_api.dart';
import 'package:car_company/data/models/company_data/company_data.dart';
import 'package:car_company/data/models/data_from_id/car_info_model.dart';

class AppRepository {
  late ApiService _apiService;

  AppRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<CompanyData> getCompany() => _apiService.infoAllCompany();

  Future<CarInfoModel> getInfoFromId({required int id}) =>
      _apiService.infoCompanyFromId(id: id);
}
