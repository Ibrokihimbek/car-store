class CompanyModels {
  int id;
  String carModel;
  num averagePrice;
  String logo;
  int establishedYear;

  CompanyModels({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompanyModels.fromJson(Map<String, dynamic> jsonData) {
    return CompanyModels(
      id: jsonData['id'] as int? ?? 0,
      carModel: jsonData['car_model'] as String? ?? '',
      averagePrice: jsonData['average_price'] as num? ?? 0,
      logo: jsonData['logo'] as String? ?? '',
      establishedYear: jsonData['established_year'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return '''
      id: $id,
      carModel: $carModel,
      averagePrice: $averagePrice,
      logo: $logo,
      establishedYear: $establishedYear
      ''';
  }
}