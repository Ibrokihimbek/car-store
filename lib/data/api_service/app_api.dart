import 'dart:convert';

import 'package:car_company/data/models/company_data/company_data.dart';
import 'package:car_company/data/models/data_from_id/car_info_model.dart';
import 'package:http/http.dart';

class ApiService {
  Future<CompanyData> infoAllCompany() async {
    try {
      Response response = await get(
          Uri.parse('https://easyenglishuzb.free.mockoapp.net/companies'));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return CompanyData.fromJson(jsonData);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<CarInfoModel> infoCompanyFromId({required int id}) async {
    try {
      Response response = await get(
          Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/$id"));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return CarInfoModel.fromJson(jsonData);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
