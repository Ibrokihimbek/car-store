import 'package:car_company/data/models/company_data/company_models.dart';

class CompanyData {
  List<CompanyModels> data;

  CompanyData({required this.data});

  factory CompanyData.fromJson(Map<String, dynamic> jsonData) {
    return CompanyData(
        data: (jsonData['data'] as List)
            .map((e) => CompanyModels.fromJson(e))
            .toList());
  }
}
