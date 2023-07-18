class CitySearchResult {
  CitySearchResult({
      this.results, 
      this.generationtimeMs,});

  CitySearchResult.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    generationtimeMs = json['generationtime_ms'];
  }
  List<Results>? results;
  num? generationtimeMs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['generationtime_ms'] = generationtimeMs;
    return map;
  }

}

class Results {
  Results({
      this.id, 
      this.name, 
      this.latitude, 
      this.longitude, 
      this.elevation, 
      this.featureCode, 
      this.countryCode, 
      this.admin1Id, 
      this.admin2Id, 
      this.admin3Id, 
      this.timezone, 
      this.population, 
      this.countryId, 
      this.country, 
      this.admin1, 
      this.admin2, 
      this.admin3,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
    featureCode = json['feature_code'];
    countryCode = json['country_code'];
    admin1Id = json['admin1_id'];
    admin2Id = json['admin2_id'];
    admin3Id = json['admin3_id'];
    timezone = json['timezone'];
    population = json['population'];
    countryId = json['country_id'];
    country = json['country'];
    admin1 = json['admin1'];
    admin2 = json['admin2'];
    admin3 = json['admin3'];
  }
  num? id;
  String? name;
  num? latitude;
  num? longitude;
  num? elevation;
  String? featureCode;
  String? countryCode;
  num? admin1Id;
  num? admin2Id;
  num? admin3Id;
  String? timezone;
  num? population;
  num? countryId;
  String? country;
  String? admin1;
  String? admin2;
  String? admin3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['elevation'] = elevation;
    map['feature_code'] = featureCode;
    map['country_code'] = countryCode;
    map['admin1_id'] = admin1Id;
    map['admin2_id'] = admin2Id;
    map['admin3_id'] = admin3Id;
    map['timezone'] = timezone;
    map['population'] = population;
    map['country_id'] = countryId;
    map['country'] = country;
    map['admin1'] = admin1;
    map['admin2'] = admin2;
    map['admin3'] = admin3;
    return map;
  }

}