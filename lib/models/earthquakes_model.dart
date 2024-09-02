import 'data_model.dart';
import 'error_model.dart';

class EarthquakesModel {
  int? httpStatus;
  String? noun;
  String? verb;
  String? errorCode;
  List<ErrorModel>? errors;
  String? friendlyError;
  String? result;
  int? count;
  List<DataModel>? data;

  EarthquakesModel(
      {this.httpStatus,
        this.noun,
        this.verb,
        this.errorCode,
        this.errors,
        this.friendlyError,
        this.result,
        this.count,
        this.data});

  EarthquakesModel.fromJson(Map<String, dynamic> json) {
    httpStatus = json['httpStatus'];
    noun = json['noun'];
    verb = json['verb'];
    errorCode = json['errorCode'];
    if (json['errors'] != null) {
      errors = <ErrorModel>[];
      json['errors'].forEach((v) {
        errors!.add(new ErrorModel.fromJson(v));
      });
    }
    friendlyError = json['friendlyError'];
    result = json['result'];
    count = json['count'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['httpStatus'] = this.httpStatus;
    data['noun'] = this.noun;
    data['verb'] = this.verb;
    data['errorCode'] = this.errorCode;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v?.toJson()).toList();
    }
    data['friendlyError'] = this.friendlyError;
    data['result'] = this.result;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
